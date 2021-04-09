class Users::HomesController < ApplicationController

  def top
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(3)
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def about
  end

end
