class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    # 3.times do
    #   @post.categories.build(:name => "Sample Category")
    # end
    @post.categories.build
  end

  def create
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    #one of avi's least favorite patterns ingroduced by DHH
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
