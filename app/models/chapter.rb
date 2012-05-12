class Chapter < ActiveRecord::Base
  attr_accessible :title, :content

  belongs_to :book
    
  validates :content, :length => {:minimum => 10}, :presence => :true
  validates :title, :presence => :true
  
  def to_param
    "#{id}-#{title.downcase}".gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')
  end

end
