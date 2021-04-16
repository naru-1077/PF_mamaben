class Users::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
      @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to  users_my_page_path
    else
      render "edit"
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(withdraw_status: true)
    reset_session
    redirect_to root_path
  end

  def post_histories
      @user = User.find(params[:id])
      @posts = @user.posts.page(params[:page]).per(6)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :withdraw_status)
  end

end
