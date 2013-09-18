class Article < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  attr_accessible :content, :title , :user

  validates_presence_of :content, :title
end
