class Article < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title , :user
end
