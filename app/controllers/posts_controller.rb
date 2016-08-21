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
    new_post = Post.new(post_params)
    user_id = current_user[:id]
    new_post[:user_id] = user_id
    city.posts << new_post
    if new_post.save
      flash[:success] = "Post created succesfully to #{city.city}!"
      redirect_to city_path(city)
    else
      flash[:error] = new_post.errors.full_messages.join(", ")
      redirect_to new_city_post_path
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def destroy
    @city = City.find_by_id(params[:city_id])
    @post = Post.find_by_id(params[:id])

    if current_user
      @post.destroy
      redirect_to city_path(@city)
    else
      redirect_to city_post_path(@city, @post)
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :text)
    end
end
