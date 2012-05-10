class Chapter < ActiveRecord::Base
  attr_accessible :title, :content
  
  belongs_to :book
    
  validates :content, :length => {:minimum => 10}
end
