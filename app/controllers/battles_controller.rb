class BattlesController < ApplicationController
  respond_to :html, :js

  def index
    @battles = Battle.all
  end

  def new
    @battle = Battle.new
    @battle.player1 = current_user
  end

  def create
    @battle = Battle.create(battle_params)
    @battle.state = "Battle Initialized"
    @battle.player1.played += 1
    turn = [@battle.player1.id, @battle.player2.id]
    @battle.turn = turn.shuffle.join(' ')
    @battle.save
    redirect_to(select_monsters_battle_path(@battle))
    # if params[:p1_monsters]
    #   params[:p1_monsters].each { |x, y|  
    #     @battle.p1_battle_monsters.create monster: (Monster.find(y)), hp: Monster.find(y).hp
    #   }
    #   @battle.state = "Player 1 selected monsters"
    #   @battle.save
    #   @battle.player1.save
    # end

    # if params[:p2_monsters]
    #   params[:p2_monsters].each { |x, y|  
    #     @battle.p2_battle_monsters.create monster: (Monster.find(y)), hp: Monster.find(y).hp
    #   }
    #   @battle.player2.played += 1
    #   @battle.state = "Player @ selected monsters"
    #   @battle.player2.save
    # end
    # turn = [@battle.player1.id, @battle.player2.id]
    # @battle.turn = turn.shuffle.join(' ')
    # @battle.save
    # redirect_to(monster_moves_battle_path(@battle))
  end

  def select_monsters
    @battle = Battle.find(params[:id])
  end

  def pick_monster_moves
    @battle = Battle.find(params[:id])

  end

  def edit
    @battle = Battle.find(params[:id])
    @turn = @battle.turn.split[0].to_i
  end

  def update
    @battle = Battle.find(params[:id])
    case @battle.state
    when "Battle Initialized"
      set_monsters("p1", params[:monsters])
      @battle.state = "Player 1 selected monsters"
      @battle.save
      @battle.player1.save
      redirect_to(select_monsters_battle_path(@battle))
    when "Player 1 selected monsters"
      # binding.pry;''
      if @battle.player2 == current_user
        set_monsters("p2", params[:monsters])
        @battle.state = "Player 2 selected monsters"
        @battle.save
        @battle.player2.save
        redirect_to(monster_moves_battle_path(@battle))
      else
        redirect_to(select_monsters_battle_path(@battle))
      end
    when "Player 2 selected monsters"
      if @battle.player1 == current_user
        # binding.pry;''
        set_moves("p1", params[:monster_moves])
        @battle.state = "Player 1 selected moves"
        @battle.save
      end
      redirect_to(monster_moves_battle_path(@battle))
    when "Player 1 selected moves"
      if @battle.player2 == current_user
        set_moves("p2", params[:monster_moves])
        @battle.state = "Player 2 selected moves"
        @battle.save
        redirect_to(edit_battle_path(@battle))
      else
      redirect_to(monster_moves_battle_path(@battle))
      end
    else
      puts 'fuuuuuck!!'
      binding.pry;''
      redirect_to(edit_battle_path(@battle))
    end
    # if  params['battle']['page'] == "moves"

    #   @battle = Battle.find(params['battle']['battle_id'].to_i)
    #   @battle.p1_battle_monsters.each do |monster|
    #     mid = monster.id
    #     params['p1_battle_monsters'][mid.to_s].each do |k, v|
    #       bmove = Move.find(v)
    #       monster.battle_monster_moves.create move: bmove, remaining_uses: bmove.remaining_uses

    #     end
    #   end
    #   @battle.p2_battle_monsters.each do |monster|
    #     mid = monster.id
    #     params['p2_battle_monsters'][mid.to_s].each do |k, v|
    #       bmove = Move.find(v)
    #       monster.battle_monster_moves.create move: bmove, remaining_uses: bmove.remaining_uses
    #     end
    #   end
    # end
    # if params["p2_monstermoves0"]
    #   @battle.p2_battle_monsters.each_with_index { |monster, i|
    #     params["p2_monstermoves#{i}"].map { |x, y| 
    #       monster.battle_monster_moves.create move: Move.find(y) }
    #     }
    #   end
      # 
    end

    def set_monsters(player, mlist)
      binding.pry;''
        mlist.each { |x, y|  
          @battle.send("#{player}_battle_monsters").create monster: (Monster.find(y)), hp: Monster.find(y).hp
        }
    end

    def set_moves(player, mlist)
      # binding.pry;''
      @battle.send("#{player}_battle_monsters").each do |monster|
        mid = monster.id
        mlist[mid.to_s].each do |k, v|
          # binding.pry;''
          bmove = Move.find(v)
          monster.battle_monster_moves.create move: bmove, remaining_uses: bmove.remaining_uses
          monster.save
        end
      end
    end

    def submit_move
      # binding.pry;''
      @battle = Battle.find(params[:id])
      attacking_monster_id = params['move'].map { |k,v| k[/\d+/] }[0].to_i
      #get attacking move
      attacking_move_id = params['move'].map { |k,v| v }[0].to_i
      #get recievers element
      if params['battle']['player'] == "1"
        attacker = @battle.p1_battle_monsters.find(attacking_monster_id)
        reciever = @battle.p2_battle_monsters.find(params['move']['opponent'].to_i)
      elsif params['battle']['player'] == "2"
        attacker = @battle.p2_battle_monsters.find(attacking_monster_id)
        reciever = @battle.p1_battle_monsters.find(params['move']['opponent'].to_i)
      end
      move = attacker.battle_monster_moves.find(attacking_move_id)
      reciever_element = reciever.monster.element.name
      #calculate damage
      if move.remaining_uses > 0
        damage = move.move.attack(reciever_element)
        remove_use(attacker, attacking_move_id)
        change_turn
      else
        damage = 0
        flash[:notice] = "Not enough remaining uses"
      end
      #take damage from reciever
      reciever.hp -= damage
      if reciever.hp < 1
        reciever.hp = 0
      end
      #take 1 from remaining moves
      #save
      reciever.save
      #redirect after checking damage
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

    def change_turn
      # binding.pry;''
      turn = @battle.turn.split.map {|x| x[/\d+/]}
      turn.reverse!
      # binding.pry;''
      @battle.turn = turn.join(' ')
      @battle.save
    end

    def league_table
      @battles = Battle.all
      @users = User.order('points DESC').all
    end

    private
    def battle_params
      params.require(:battle).permit(:player1_id, :player2_id, :p1_monsters, :p2_monsters)
    end

  end
