class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # binding.pry
    if post_params[:categories_attributes][:"0"][:name]== ""
        post = Post.create(post_params)
        post.categories = nil
        post.save
        redirect_to post
    else
        post = Post.create(post_params)
        redirect_to post
    end
    
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
