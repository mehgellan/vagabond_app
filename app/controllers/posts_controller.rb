class PostsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_city, only: [:index, :new, :show, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_ownership!, only: [:edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @city.posts << @post
    if @post.save
      flash[:success] = "Post created succesfully to #{@city.name}!"
      redirect_to city_path(@city)
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      redirect_to new_city_post_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    flash[:notice] = "Post update succesful!"
    redirect_to city_post_path
  end

  def destroy
    @post.destroy
    flash[:error] = "Post succesfully deleted!"
    redirect_to city_path(@city)
  end


  private

    def require_ownership!
      if !current_user_is_owner?
        flash[:errror] = "You must be logged in as #{@post.user.first_name}"
        redirect_to user_login_path
      end
    end

    def set_city
      @city = City.find_by_slug(params[:city_id])
    end

    def set_post
      @post = Post.find_by_id(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :text)
    end


end
