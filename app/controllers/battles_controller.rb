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
      @battle.p1_battle_monsters.create monster: (Monster.find(y)), hp: Monster.find(y).hp
    }
    params[:p2_monsters].each { |x, y|  
      @battle.p2_battle_monsters.create monster: (Monster.find(y)), hp: Monster.find(y).hp
    }
    # binding.pry;''
    redirect_to(monster_moves_battle_path(@battle))
  end

  def pick_monster_moves
    @battle = Battle.find(params[:id])

  end

  def edit
    @battle = Battle.find(params[:id])
    @p1_monsters = 
    @turn = [1,2]
  end

  def update
    @battle = Battle.find(params['battle']['battle_id'].to_i)
    if  params['battle']['page'] == "moves"
      @battle.p1_battle_monsters.each do |monster|
        mid = monster.id
        params['p1_battle_monsters'][mid.to_s].each do |k, v|
          monster.battle_monster_moves.create move: Move.find(v)
        end
      end
      @battle.p2_battle_monsters.each do |monster|
        mid = monster.id
        params['p2_battle_monsters'][mid.to_s].each do |k, v|
          monster.battle_monster_moves.create move: Move.find(v)
        end
      end
    end
    if params["p2_monstermoves0"]
      @battle.p2_battle_monsters.each_with_index { |monster, i|
        params["p2_monstermoves#{i}"].map { |x, y| 
          monster.battle_monster_moves.create move: Move.find(y) }
        }
      end
      redirect_to(edit_battle_path(@battle))
    end


    private
    def battle_params
      params.require(:battle).permit(:player1_id, :player2_id, :p1_monsters, :p2_monsters)
    end

  end
