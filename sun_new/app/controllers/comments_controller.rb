class CommentsController < ApplicationController
  def create
     @post = Post.find(params[:post_id])
     comments_new=params[:comment].merge({:user_id=>session[:user_id]})
     @comment = @post.comments.new(comments_new)
     redirect_to @post if @comment.save
  end
end
