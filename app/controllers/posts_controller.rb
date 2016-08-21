class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @city = City.find(params[:city_id])
    new_post = Post.new(post_params)
    user_id = current_user[:id]
    new_post[:user_id] = user_id
    if new_post.save
      flash[:success] = "Post successfuly created!"
      city.posts << new_post
      redirect_to city_path(city)
    else
      flash[:error] = new_post.errors.full_messages.join(", ")
      redirect_to new_user_post_path(user)
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  private

    def post_params
      params.require(:post).permit(:title, :text)
    end
end
