class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @battle = Battle.new
    @battle.player1 = current_user
    # @battles = Battle.where("Player2_id = #{current_user.id}")
    @battles = Battle.all.limit(8)
    @users = User.order('points DESC').all

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
