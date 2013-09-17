class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  attr_accessible :content, :selection, :block
end
