class Board < ActiveRecord::Base
  attr_accessible :id, :title
  has_many :conversations
end