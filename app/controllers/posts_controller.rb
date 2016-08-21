class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @city = City.find_by_id(params[:city_id])
  end

  def create
    city = City.find_by_id(params[:city_id])
    new_post = Post.create(post_params)
    user_id = current_user[:id]
    new_post[:user_id] = user_id
    city.posts << new_post
    redirect_to city_path(city)
  end

  def show
    @post = Post.all(:order => "created_at DESC")

  end

  private

    def post_params
      params.require(:post).permit(:title, :text)
    end
end
