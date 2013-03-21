class Post < ActiveRecord::Base
   attr_accessible :content, :title,:user,:user_id
  validates :title,:presence => true,:uniqueness=>true
  validates :content,:presence => true
  has_many :comments
  has_many :attachments
  belongs_to :user
end
