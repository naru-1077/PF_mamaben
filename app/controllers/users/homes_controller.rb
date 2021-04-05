class Users::HomesController < ApplicationController

  def top
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(3)
  end

  def about
  end

end
