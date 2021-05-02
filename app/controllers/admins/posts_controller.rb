class Admins::PostsController < ApplicationController

  before_action :authenticate_admin!

  def index
    if params[:keyword] == 'score'
      @posts = Post.all.order(score: 'ASC').page(params[:page]).per(12)
      @posts_all = Post.all
    elsif params[:keyword].blank?
      @posts = Post.page(params[:page]).per(12)
      @posts_all = Post.all
      # @genre = Genre.find(params[:id]) if params[:id]
      @genres = Genre.all
      # @q = Post.ransack(params[:q])
      # post = @q.result
      # @post_count = post.size
      # @posts_search = post.page(params[:page]).per(12)
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
