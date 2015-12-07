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
    
    if  params['battle']['page'] == "moves"
      @battle = Battle.find(params['battle']['battle_id'].to_i)
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

    def submit_move
      @battle = Battle.find(params[:id])
      # binding.pry;''
      attacking_monster_id = params['move'].map { |k,v| k[/\d+/] }[0].to_i
      #get attacking move
      attacking_move_id = params['move'].map { |k,v| v }[0].to_i
      #get recievers element
      if params['battle']['player'] == "1"
        attacker = @battle.p1_battle_monsters.find(attacking_monster_id)
        reciever = @battle.p2_battle_monsters.find(params['move']['opponent'].to_i)
      elsif params['battle']['player'] == "2"
        # binding.pry;''
        attacker = @battle.p2_battle_monsters.find(attacking_monster_id)
        reciever = @battle.p1_battle_monsters.find(params['move']['opponent'].to_i)
      end
      move = attacker.battle_monster_moves.find(attacking_move_id)
      reciever_element = reciever.monster.element.name
      #calculate damage
      damage = move.move.attack(reciever_element)
      #take damage from reciever
      reciever.hp -= damage
      # binding.pry;''
      #take 1 from remaining moves
      #save
      reciever.save
      #redirect
      redirect_to(edit_battle_path(@battle))
    end

    private
    def battle_params
      params.require(:battle).permit(:player1_id, :player2_id, :p1_monsters, :p2_monsters)
    end

  end
