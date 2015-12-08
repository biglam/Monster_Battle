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
    @battle.player1.played += 1
    @battle.player2.played += 1
    @battle.player1.save
    @battle.player2.save
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
          bmove = Move.find(v)
          monster.battle_monster_moves.create move: bmove, remaining_uses: bmove.remaining_uses

        end
      end
      @battle.p2_battle_monsters.each do |monster|
        mid = monster.id
        params['p2_battle_monsters'][mid.to_s].each do |k, v|
          bmove = Move.find(v)
          monster.battle_monster_moves.create move: bmove, remaining_uses: bmove.remaining_uses
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
      if move.remaining_uses > 0
        damage = move.move.attack(reciever_element)
        remove_use(attacker, attacking_move_id)
      else
        damage = 0
        flash[:notice] = "Not enough remaining uses"
      end
      #take damage from reciever
      reciever.hp -= damage
      if reciever.hp < 1
        reciever.hp = 0
      end
      # binding.pry;''
      
      # binding.pry;''
      #take 1 from remaining moves
      #save
      reciever.save
      #redirect after checking damage
      # binding.pry;''
      if game_won 
        flash[:notice] = "WINNER"
        redirect_to(battle_path(@battle))
      else
        flash[:notice] = "Damage #{damage}"
        redirect_to(edit_battle_path(@battle))
      end
    end

    def remove_use(attacker, move_id)
      move = attacker.battle_monster_moves.find(move_id)
      move.remaining_uses -= 1
      move.save
    end

    def game_won
      # binding.pry;'' 
      if (@battle.p1_battle_monsters.map {|x| x.hp }.inject{|sum, x| sum + x} < 1 )
        @battle.winner_id = @battle.player2_id 
        @battle.player2.wins += 1
        @battle.player2.points += 3
        @battle.player2.save
        @battle.save
        return true
      elsif (@battle.p2_battle_monsters.map {|x| x.hp }.inject{|sum, x| sum + x} < 1)
        @battle.winner_id = @battle.player1_id
        @battle.player1.wins += 1
        @battle.player1.points += 3
        @battle.player1.save
        @battle.save
        return true
    else
      return false
    end
    end

    def show
      @battle = Battle.find(params[:id])
    end

    private
    def battle_params
      params.require(:battle).permit(:player1_id, :player2_id, :p1_monsters, :p2_monsters)
    end

  end
