class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @city = City.find_by_id(params[:city_id])
    if session[:user_id] == @user[:id]
      render :new
    else
      redirect_to user_login_path
    end
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
    @user = User.find_by_id(params[:id])
    @city = City.find_by_id(params[:city_id])
    @post = Post.find_by_id(params[:id])
  end

  def edit
    @city = City.find_by_id(params[:city_id])
    post_id = params[:id]
    @post = Post.find_by_id(post_id)
  end

  def update
    @city = City.find_by_id(params[:city_id])
    user_id = current_user[:id]
    @post = Post.find_by_id(params[:id])
    @post[:user_id] = user_id
    if session[:user_id] == @post.user_id
      @post.update(post_params)
      flash[:notice] = "Post update succesful!"
      redirect_to city_post_path
    else
      redirect_to user_login_path
    end
  end

  def destroy
    @city = City.find_by_id(params[:city_id])
    @post = Post.find_by_id(params[:id])
    if session[:user_id] == @post.user_id
      @post.destroy
      flash[:notice] = "Post succesfully deleted!"
      redirect_to city_path(@city)
    else
      flash[:notice] = "You must be logged in as #{@post.user.first_name}"
      redirect_to city_path(@city)
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
end
