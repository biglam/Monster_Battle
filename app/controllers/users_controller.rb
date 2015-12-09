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
    
    # year_of_birth = params[:user][:date_of_birth].to_date.year
    
    # @user.update(user_params) #from the private method below - whitelist check

    redirect_to(user_path)

   end

   # private

   #  def user_params
   #   params.require(:user).permit(:name, :email, :password,
   #    :password_confirmation, :id, :gender)
   # end

end
