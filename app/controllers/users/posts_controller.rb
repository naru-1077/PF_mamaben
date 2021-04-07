class Users::PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(8)
    @posts_all = Post.all
    @genre = Genre.find(params[:id]) if params[:id]
    @genres = Genre.all
  end

  def new
    @post = Post.new
    @genres = Genre.all
    @post.build_recipe
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save!
      redirect_to post_path(@post)
    else
      @post = Post.new
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @posts_all = Post.all
  end

  def edit
   @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_path(@post)
  end


  private
  def post_params
      params.require(:post).permit(:image, :title, :introduction, :material, :genre_id, recipe_attributes: [:id, :recipe_image, :recipe, :user_id])
  end

end
