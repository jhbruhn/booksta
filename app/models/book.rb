class Book < ActiveRecord::Base
  attr_accessible :title, :subtitle
  has_many :chapters
  belongs_to :user
end
