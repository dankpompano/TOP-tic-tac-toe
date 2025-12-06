require_relative './Board'
require_relative './Player'
#this will track the state of the game(turn and check for wins) as well as call the console prints
class Game
  def initialize
    @board = Board.new
    @player = Player.new
    @current_player = @player.player1
  end
  
  def switchTurns
    if @current_player == @player.player1
      @current_player = @player.player2
    else
      @current_player = @player.player1
    end
  end

  def round(move) #A1 B3 C2
    move.upcase!
    row = move[0]
    col = move[1]
    
    row_index = @board.rows_map[row] #check the hash
    col_index = @board.columns_map[col]
    
    # check if move is invalid such as D4
    if(row_index.nil? || col_index.nil?)
      puts "Invalid move. Please try again"
      return false
    end
    
    valid = @board.updateBoard(row_index,col_index, @current_player)
    if !valid
      puts "That space is already taken. Try another"
    end
    @board.display
    return true
  end

  def play
    puts "It is #{current_player} turn. Enter your move (e.g. A1):"
  end

  def draw
    
  end
  
  def win
    
  end

end


