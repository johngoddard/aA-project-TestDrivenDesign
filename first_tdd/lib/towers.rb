require 'byebug'
class Towers

  attr_reader :towers, :user_move

  def initialize
    @towers = [[1,2,3], [], []]
  end

  def play
    puts "Welcome to Towers of Hanoi"
    until won?
      begin
        puts "Enter a position (eg 0,1)"
        render_towers
        user_input = gets.chomp

        if valid_input?(user_input)
          parse_input(user_input)

          move_disc(@user_move)
        end
      rescue => e
        puts e
        retry
      end
    end

    puts "You win Towers of Hanoi!!!! :D"
  end

  def valid_input?(user_move)
    pos = user_move.split(",") #['0', '1']
    pos.length == 2 &&
      pos.all?{|el| el.between?("0", "2")} &&
        pos[0] != pos[1] &&
          !@towers[pos[0].to_i].empty?
  end

  def parse_input(user_input)
    @user_move = user_input.split(",").map{|el|el.to_i}
  end

  def move_disc(user_move)
    start_tower = @towers[user_move[0]]
    end_tower = @towers[user_move[1]]

    if end_tower.empty? || (end_tower.first > start_tower.first)
      @towers[user_move[1]].unshift(@towers[user_move[0]].shift)
    else
      raise "You can't make that move :("
    end
  end

  def won?
    @towers[1..2].any?{|tower| tower == [1,2,3]}
  end

  def render_towers
    print @towers
    puts
  end

end

if __FILE__ == $PROGRAM_NAME
  t = Towers.new.play
end
