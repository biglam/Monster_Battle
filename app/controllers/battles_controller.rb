class BattlesController < ApplicationController

  def index
    @battles = Battle.all
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
  end

  private
  def battle_params
    params.require(:battle).permit(:player1_id, :player2_id)
  end
  
end
