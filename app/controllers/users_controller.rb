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
    @user = User.create(user_params) # TODO: add error handling
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

  def update
    user_id = params[:id]
    @user = User.find_by_id(user_id) # TODO: add error handling
    @user.update_attributes(user_params)
    redirect_to user_path(@user)
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password)
    end

end
