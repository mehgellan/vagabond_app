class UsersController < ApplicationController

  def index
    if current_user
      render :index
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      NewUserEmailMailer.notify_user(@user).deliver
      flash[:success] = "Succesfully created account."
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def show
    @post = Post.find_by_id(params[:post_id])
    @city = City.find_by_id(params[:city_id])
    @user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
    if session[:user_id] != @user[:id]
      flash[:alert] = "This ain't your profile!"
      redirect_to user_path
    else
      render :edit
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.update_attributes(user_params)
    if session[:user_id] == @post.user_id
      flash[:notice] = "Profile update succesful!"
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password)
    end
end
