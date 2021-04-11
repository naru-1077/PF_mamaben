class Users::HomesController < ApplicationController

  def top
    @posts = Post.limit(3).order(created_at: :desc)
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end

  def about
  end

end
