class UsersController < ApplicationController
  

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params[:user].permit(:name,:email, :gender))
    redirect_to(user_path)

   end
 



end
