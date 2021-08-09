class UsersController < ApplicationController
  def index 
    @users = User.all
  end


  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    if @user.save
      p @user.errors.count
      redirect_to @user, alart:"User create successfully"
    else
      redirect_to new_user_path, alart:"errors"
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :salt, :encrypted_password)
  end
end
