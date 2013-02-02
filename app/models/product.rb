class Product < ActiveRecord::Base
  attr_accessible :category, :description, :designer, :name, :price, :image_url #need to put in avatar uploader yoke
  has_many :line_items
  has_many :orders, through: :line_items
#  default_scope :order => 'title'
  belongs_to :user


  def self.search(search_query, search_by)
    if search_query
      if search_by == 'all'
        like = "%#{search_query}%"
        find(:all, :conditions => ["name LIKE ? OR category LIKE ? OR designer LIKE ?", like, like, like])
      else
        find(:all, :conditions => ["#{search_by} LIKE ?", "%#{search_query}%"])
      end
    else
      find(:all)
    end
  end
end