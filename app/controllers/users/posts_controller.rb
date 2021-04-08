class Users::PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(6)
    @posts_all = Post.all
    @genre = Genre.find(params[:id]) if params[:id]
    @genres = Genre.all
  end

  def new
    @post = Post.new
    @genres = Genre.all
    # @post.build_recipe
    @recipe = @post.recipes.build
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      @post = Post.new
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @comments = @post.post_comments
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
    redirect_to posts_path
  end


  private
  def post_params
      params.require(:post).permit(:image, :title, :introduction, :material, :genre_id, recipes_attributes: [:recipe_image, :recipe])
  end

end
