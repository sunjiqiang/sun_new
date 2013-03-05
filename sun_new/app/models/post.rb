class Post < ActiveRecord::Base
   attr_accessible :content, :title,:user
  validates :title,:presence => true,:uniqueness=>true
  validates :content,:presence => true
  has_many :comments
  has_many :attachments
end
