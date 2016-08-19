class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params) # TODO: add error handling
    redirect_to @user
  end

  def show
    @user = User.find_by_id(params[:id])
<<<<<<< HEAD
<<<<<<< HEAD

=======
>>>>>>> 5d4d0f609f2e6004f82a2b403cb0679eb6068733
=======
>>>>>>> 5d4d0f609f2e6004f82a2b403cb0679eb6068733
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
