class Comment < ActiveRecord::Base
 attr_accessible :content, :post_id,:user
  belongs_to :post
end
