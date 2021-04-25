class Admins::PostsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @posts = Post.page(params[:page]).per(12)
    @posts_all = Post.all
    # @genre = Genre.find(params[:id]) if params[:id]
    @genres = Genre.all
    @q = Post.ransack(params[:q])
    post = @q.result
    @post_count = post.size
    @posts_search = post.page(params[:page]).per(12)
    @tags = Post.tag_counts_on(:tags).most_used(20)
    if !params[:tag_name].blank? # タグ検索用
      post = Post.tagged_with(params[:tag_name])
      @post_count = post.size
      @posts_search = post.page(params[:page]).per(12) # タグに紐付く投稿
    end
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @comments = @post.post_comments
    @tags = @post.tag_counts_on(:tags)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

end
