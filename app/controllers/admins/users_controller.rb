class Admins::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admins_user_path(@user)
    else
      render "edit"
    end
  end

  def post_histories
      @user = User.find(params[:id])
      @posts = @user.posts.page(params[:page]).per(6)
  end

  def posts_by_own_comments
      @user = User.find(params[:id])
      post_ids = PostComment.where(user_id: params[:id]).map(&:post_id).uniq
      @posts = Post.where(id: post_ids).page(params[:page]).per(6)
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :withdraw_status)
  end

end
