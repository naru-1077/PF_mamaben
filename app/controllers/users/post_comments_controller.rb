class Users::PostCommentsController < ApplicationController

  before_action :authenticate_user!

  def index
    @post_comments = PostComment.where(post_id: params[:post_id]).page(params[:page]).per(6)
  end

  def create
    @post_comments = PostComment.where(post_id: params[:post_id])
    count = 0
    @arrow_comment = true
    @post_comments.each do |post_comment|
      if current_user.id == post_comment.user_id
        count += 1
        @arrow_comment = false
      end
    end
    if count >= 1
    else
      @comment = current_user.post_comments.new(post_comment_params)
      @comment.post_id = params[:post_id]
      @comment.save
    end
  end

  def destroy
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
