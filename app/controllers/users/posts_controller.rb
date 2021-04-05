class Users::PostsController < ApplicationController

  def index
    @posts = post.page(params[:page]).per(8)
    @posts_all = post.all
    @genre = Genre.find(params[:id]) if params[:id]
    @genres = Genre.all
  end

  def new
    @post = Post.new
  end

  def create
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(8)
  end

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(8)
  end

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(8)
  end

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(8)
  end

  def index
    @posts = Post.all.order("created_at DESC").page(params[:page]).per(8)
  end

end
