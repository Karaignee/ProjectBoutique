class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type, :list,  :line_items, :cart_id, :user_id
  # create an accessor that can be used from Order.<name>
  belongs_to :user
  has_many :line_items,  dependent: :destroy
  has_many :products

  class << self
  	attr_accessor :list
  end
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  @list = ["Cheque", "Credit Card", "Purchase Order", "Paypal"]

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: @list
end


