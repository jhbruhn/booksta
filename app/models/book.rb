class Book < ActiveRecord::Base
  attr_accessible :title, :subtitle
  has_many :chapters
  belongs_to :user
  
  def to_param
    "#{id}-#{title.downcase}-by-#{user.to_s}".gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')
  end
end
