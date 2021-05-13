class Users::PostsController < ApplicationController

  before_action :authenticate_user!,except: [:index]

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
    # create_params = post_params
    # for i in 0..8 do
    #   if create_params["recipes_attributes"][i.to_s]["recipe_image"] == "{}" and create_params["recipes_attributes"][i.to_s]["recipe"].blank?
    #     create_params["recipes_attributes"][i.to_s]["_destroy"] = "1"
    #   end
    # end
    @post = Post.new(post_params)
    @post.user = current_user
    text = @post.title+","+@post.introduction+","+@post.material+"," # AI　title,introduction,material
    @post.recipes.each do |recipe|
      text += recipe.recipe+","  # AI　上記のtextにrecipeをあるだけ足す
    end
    @post.score = Language.get_data(text) # AI　@post.scoreの中にLanguage.get_data(text)を入れる
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = current_user
    @comments = @post.post_comments
    @tags = @post.tag_counts_on(:tags)
    @post_comments = current_user.post_comments.where(post_id:@post.id)
  end

  def edit
   @post = Post.find(params[:id])
  # if @post.recipes.count < 9
  #   (@post.recipes.count..8).each do |recipe|
  #     @post.recipes.push(Recipe.new)
  #   end
  # end
  end

  def update
    @post = Post.find(params[:id])
    text = update_post_params[:title]+","+update_post_params[:introduction]+","+update_post_params[:material] # AI　title,introduction,material
    update_post_params["recipes_attributes"].to_h.each_with_index do |item, index|
      text += item[1]["recipe"] + ","
    end
    @post.score = Language.get_data(text)
    if @post.update(update_post_params.merge(score: @post.score))
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
      params.require(:post).permit(:image, :title, :introduction, :material, :genre_id, :tag_list, recipes_attributes: [:id, :recipe_image, :recipe, :_destroy])
  end

  def update_post_params
      params.require(:post).permit(:image, :title, :introduction, :material, :genre_id, :tag_list, recipes_attributes: [:id, :recipe_image, :recipe, :_destroy])
  end

end
