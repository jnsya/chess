require_relative 'board'
require_relative 'player'



class Game

  def start
    @board = Board.new
    @contents = @board.contents
    @board.visualise
    create_players
    set_current_player
  end

  def new_turn
    puts "TURN: #{@current_player}"
    moves = @current_player.elicit_move
    puts start = moves[0]
    puts target = moves[1]
    # puts start.class
    # puts start[0].class
    puts @board.valid_move?(start, target, @current_player.colour)
    # puts @board.route_blocked?(start, target)
    while !@board.valid_move?(start, target, @current_player.colour)
      puts "Not a valid move!"
      new_turn
    end
    @board.move(start, target)
    @board.visualise
  end

  def create_players
    @players = [Player.new(1, :white)] << Player.new(2, :black)
  end


  def set_current_player
    @current_player = @players[0]
  end


  def switch_current_player
    @current_player = (@current_player == @players[0] ? @players[1] : @players[0])
  end

end

game = Game.new
game.start
game.new_turn


# [  X  , "0,1", "0,2", "0,3", "0,4", "0,5", "0,6", "0,7", "0,8"]
#
# [  X  , "1,1", "1,2", "1,3", "1,4", "1,5", "1,6", "1,7", "1,8"]
#
# [  X  , "2,1", "2,2", "2,3", "2,4", "2,5", "2,6", "2,7", "2,8"]
#
# [  X  , "3,1", "3,2", "3,3", "3,4", "3,5", "3,6", "3,7", "3,8"]
#
# [  X  , "4,1", "4,2", "4,3", "4,4", "4,5", "4,6", "4,7", "4,8"]
#
# [  X  , "5,1", "5,2", "5,3", "5,4", "5,5", "5,6", "5,7", "5,8"]
#
# [  X  , "6,1", "6,2", "6,3", "6,4", "6,5", "6,6", "6,7", "6,8"]
#
# [  X  , "7,1", "7,2", "7,3", "7,4", "7,5", "7,6", "7,7", "7,8"]
