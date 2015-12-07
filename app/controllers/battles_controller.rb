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
    # binding.pry;''
    @battle = Battle.create(battle_params)
    
    params[:p1_monsters].each { |x, y|  
      @battle.p1_battle_monsters.create monster: (Monster.find(y))
    }
    params[:p2_monsters].each { |x, y|  
      @battle.p2_battle_monsters.create monster: (Monster.find(y))
    }
    binding.pry;''
    # @battle.p1_monsters = params[:p1_monsters].map {|k,v| v.to_i}.join(' ')
    # @battle.p2_monsters = @battle.select_random_monsters.map {|k, v| k[:id] }.join(' ')
    # @battle.save
    redirect_to(edit_battle_path(@battle.id))
  end

  def edit
    @battle = Battle.find(params[:id])
    # @p1_monsters = (@battle.p1_monsters.split.map { |x| x.to_i }).map { |a| b =Monster.find(a); {name: b.name, id: b.id, hp: b.hp, element: b.element.name} }
    # @p2_monsters = (@battle.p2_monsters.split.map { |x| x.to_i }).map { |a| b =Monster.find(a); {name: b.name, id: b.id, hp: b.hp, element: b.element.name} }
    @p1_monsters = 
    @turn = [1,2]
    # @message = "Ajax!" if request.xhr?

    # render @battle, layout: false i#request.xhr?
  end

  # def fight
  #   a = "string".to_json
  # end

  private
  def battle_params
    params.require(:battle).permit(:player1_id, :player2_id, :p1_monsters, :p2_monsters)
  end
  
end
