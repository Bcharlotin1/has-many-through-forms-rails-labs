class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    # binding.pry
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # binding.pry
        post = Post.create(post_params)
      
        redirect_to post

  end

  def update
    @post = Post.find(params[:id])

    @post.comments(post_params)
binding.pry
    if @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
