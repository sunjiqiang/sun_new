class CommentsController < ApplicationController
  def create
     @post = Post.find(params[:post_id])
     comments_new=params[:comment].merge({:user=>session[:user_name]})
     @comment = @post.comments.new(comments_new)
     redirect_to @post if @comment.save
  end
end
