class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.confirm(user_params)
    if @user
      flash[:success] = "Login successful. Welcome!"
      login(@user)
      redirect_to @user
    else
      flash[:error] = "Incorrect email or password. Please try again."
      redirect_to user_login_path
    end
  end

  def destroy
    flash[:success] = "Logout succesful. See you soon!"
    logout
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
