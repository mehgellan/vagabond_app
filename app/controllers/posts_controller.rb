class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @city = City.find_by_id(params[:city_id])
    @city.posts.push(post_params)
    redirect_to city_path(@city)
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:title, :text)
    end
end
