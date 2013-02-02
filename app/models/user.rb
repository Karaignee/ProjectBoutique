class User < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :password, :level, :updating_levels,
                  :first_name, :last_name, :profile_name, :order_id
  attr_accessor :password
  before_save :encrypt_password

  validates :email,
            :uniqueness => true,
            :length => {:within => 5..50},
            :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}
  
  validates :password,
            :confirmation => true,
            :length => {:within => 4..20},
            :presence => true,
            :if => lambda { |u| not u[:updating_levels] }
  
  has_many  :products
  has_many  :orders, :include => :line_items, :dependent => :destroy

  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end
  
  protected
  def encrypt_password
    return if password.blank?
    self.hashed_password = encrypt(password)
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end
end