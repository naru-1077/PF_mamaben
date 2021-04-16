class Users::FavoritesController < ApplicationController

  before_action :authenticate_user!

  def index
    @favorites = current_user.favorite_posts.page(params[:page]).per(6)
  end

  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end

end