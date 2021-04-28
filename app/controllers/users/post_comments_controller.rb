class Users::PostCommentsController < ApplicationController

  before_action :authenticate_user!

  def index
    @post_comments = PostComment.where(post_id: params[:post_id]).page(params[:page]).per(6)
  end

  def create
    @post_comments = PostComment.where(post_id: params[:post_id])
    @allow_comment = true
    @post_comments.each do |post_comment|
      if current_user.id == post_comment.user_id
        @allow_comment = false
        return
      end
    end
    if @allow_comment
      @post_comments = current_user.post_comments.where(post_id:params[:post_id])
      @comment = current_user.post_comments.new(post_comment_params)
      @comment.post_id = params[:post_id]
      @comment.save
    end
  end

  def destroy
    @post_comments=current_user.post_comments.where(post_id:params[:post_id])
    @comment = PostComment.find_by(id: params[:id], post_id: params[:post_id])
    @comment.destroy
  end

  def my_comments
    @post_comments = current_user.post_comments.page(params[:page]).per(6)
    render action: :index
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
