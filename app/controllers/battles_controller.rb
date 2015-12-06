class BattlesController < ApplicationController
  respond_to :html, :js

  def index
    @battles = Battle.all
    # render @battles, layout: false if request.xhr?
  end

  def new
    @battle = Battle.new
  end

  def create
    @battle = Battle.create(battle_params)
    redirect_to(edit_battle_path(@battle.id))
  end

  def edit
    @battle = Battle.find(params[:id])
    @message = "Ajax!" if request.xhr?
    # render @battle, layout: false if request.xhr?

  end

  private
  def battle_params
    params.require(:battle).permit(:player1_id, :player2_id)
  end
  
end
