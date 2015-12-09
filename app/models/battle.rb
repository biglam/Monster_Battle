class Battle < ActiveRecord::Base

  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: 'User'
  has_many :p1_battle_monsters, -> { where(player: 'player1').order(:position) }, class_name: 'BattleMonster'
  has_many :p2_battle_monsters, -> { where(player: 'player2').order(:position)  }, class_name: 'BattleMonster'
  # belongs_to :battle_monsters

  def cl_setup(p1_id, p2_id) #command line only
    @p1_id = p1_id #
    @p2_id = p2_id#
    @turn = [1,2]#
    @p1_monsters = set_monster_list #
    @p2_monsters = select_random_monsters #
    puts "Player1 Monsters - "
    @p1_monsters.each do |m| #ajax?
      puts "Name: #{m[:name]} - HP Remaining: #{m[:hp]} - Element #{m[:element]}"
    end
    puts "Player2 Monsters - "
    @p2_monsters.each do |m| #ajax?
      puts "Name: #{m[:name]} - HP Remaining: #{m[:hp]} - Element #{m[:element]}"
    end
    # binding.pry;''
    until @p1_monsters.length == 0 || @p2_monsters.length == 0 #all monsters defeated
      until @p1_monsters[0][:hp] <= 1 || @p2_monsters[0][:hp] <= 1 #1 moster defeated
        if @turn[0] == 1
          fight_monsters(@p1_monsters[0], @p2_monsters[0])
        else
          fight_monsters(@p2_monsters[0], @p1_monsters[0])
        end
        puts "Health - #{@p1_monsters[0][:name]} - #{@p1_monsters[0][:hp]}"
        puts "Health - #{@p2_monsters[0][:name]} - #{@p2_monsters[0][:hp]}"
      end
      if @p1_monsters[0][:hp] <= 1 
        loser = @p1_monsters.shift
        winner_id = @p1_id 
      elsif @p2_monsters[0][:hp] <= 1 
        loser =@p2_monsters.shift
        winner_id = @p2_id
      end
      puts "#{loser[:name]} has been defeated!"
    end
  end

  def select_monster
    Monster.all.each do |m|
      puts "#{m.id} - #{m.name}"
    end
    selection = (gets.chomp).to_i
    return selection
  end

  def set_monster_list
    list = []
    4.times do |mon|
      selection = Monster.find(select_monster)
      list[mon] = {name: selection.name, id: selection.id, hp: selection.hp, element: selection.element.name}
    end
    return list
  end

  def select_random_monsters
    list = []
    available_monsters = Monster.all.map { |mon| mon.id }
    4.times do |mon|
      selection = Monster.find(available_monsters.sample)
      list[mon] = {name: selection.name, id: selection.id, hp: selection.hp, element: selection.element.name}
    end
    return list
  end

  def rotate_turn
    @turn.reverse!
    return @turn[0]
  end

  def fight_monsters(monster1, monster2)
    puts "Select a move"
    available_moves = [0]
    Monster.find(monster1[:id]).moves.each do |move|
      puts "#{move.id} - #{move.name}"
      available_moves << move.id
    end
    movechoice = nil
    until available_moves.include? movechoice
      puts 'Enter a valid move number or 0 for random'
      movechoice = gets.chomp.to_i
    end
    if movechoice == 0
      available_moves.shift
      damage = Move.find(available_moves.sample).attack(monster2[:element])
    else
      damage = Move.find(movechoice).attack(monster2[:element])
    end
    puts damage
    monster2[:hp] -= damage
    rotate_turn
  end

  def battle_model_return_test
    return "Battle Test from Ruby"
  end

end
