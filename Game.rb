require_relative './Board'
require_relative './Player'
#this will track the state of the game(turn and check for wins) as well as call the console prints
class Game
  def initialize
    @board = Board.new
    @player = Player.new
    @current_player = @player.player1
    @winner = ""
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
    
    valid = @board.update_board(row_index, col_index, @current_player)
    if !valid
      puts "That space is already taken. Try another"
    end

    return false unless valid
    @board.display
    switchTurns
    return true
  end

  def play
  until check_win || check_draw
    puts "It is #{@current_player} turn. Enter your move (e.g. A1):"
    @board.display
    move = gets.chomp
    
    # Only continue if valid move
    next unless round(move)

    # After round(move), the board updated. Now check win/draw.
    if check_win
      puts "#{@winner} is the winner!"
      return
    elsif check_draw
      puts "Draw!"
      return
    end
  end
  end

  def check_draw
    @board.get_board.flatten.none? { |space| space == " " }
  end
  
  def check_win
    current_board = @board.get_board
    
    for row in 0..2 do
      #cols loop
      if(current_board[row][0] == current_board[row][1] && current_board[row][0] == current_board[row][2] && current_board[row][0] != " ")
        @winner = current_board[row][0]
        return true            
      end
    end
    
    for col in 0..2 do
      #rows loop    
      if(current_board[0][col] == current_board[1][col] && current_board[0][col] == current_board[2][col] && current_board[0][col] != " ")
        @winner = current_board[0][col]
        return true            
      end
    end
      
      #diag check
      if(current_board[0][0] == current_board[1][1] && current_board[0][0] == current_board[2][2] && current_board[0][0] != " ")
        @winner = current_board[0][0]
        return true
      end
      
      if(current_board[2][0] == current_board[1][1] && current_board[2][0] == current_board[0][2] && current_board[2][0] != " ")
        @winner = current_board[2][0]
        return true      
      end

    return false
  end
end

game = Game.new
game.play