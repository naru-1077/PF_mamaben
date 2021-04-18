class Users::PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(6)
    @posts_all = Post.all
    # @genre = Genre.find(params[:id]) if params[:id]
    @genres = Genre.all
    @q = Post.ransack(params[:q])
    post = @q.result
    @post_count = post.size
    @posts_search = post.page(params[:page]).per(6)
    @tags = Post.tag_counts_on(:tags).most_used(20)
    if !params[:tag_name].blank? # タグ検索用
      post = Post.tagged_with(params[:tag_name])
      @post_count = post.size
      @posts_search = post.page(params[:page]).per(6) # タグに紐付く投稿
    end
  end

  def new
    @post = Post.new
    @genres = Genre.all
    # @post.build_recipe
    # @recipe = @post.recipes.build
    # 上のはコントローラではなくviewにて定義
  end

  def create
    create_params = post_params
    for i in 0..5 do
      if create_params["recipes_attributes"][i.to_s]["recipe_image"] == "{}" and create_params["recipes_attributes"][i.to_s]["recipe"].blank?
        create_params["recipes_attributes"][i.to_s]["_destroy"] = "1"
      end
    end
    @post = Post.new(create_params)
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
    @tags = @post.tag_counts_on(:tags)
  end

  def edit
   @post = Post.find(params[:id])
   if @post.recipes.count < 6
     (@post.recipes.count..5).each do |recipe|
       @post.recipes.push(Recipe.new)
     end
   end
  end

  def update
    @post = Post.find(params[:id])
    update_params = update_post_params
    for i in 0..5 do
      if update_params["recipes_attributes"][i.to_s]["recipe_image"] == "{}" and update_params["recipes_attributes"][i.to_s]["recipe"].blank?
        update_params["recipes_attributes"][i.to_s]["_destroy"] = "1"
      end
    end
    if @post.update(update_params)
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
      params.require(:post).permit(:image, :title, :introduction, :material, :genre_id, :tag_list, recipes_attributes: [:recipe_image, :recipe])
  end

  def update_post_params
      params.require(:post).permit(:image, :title, :introduction, :material, :genre_id, :tag_list, recipes_attributes: [:recipe_image, :recipe, :_destroy, :id])
  end

end
