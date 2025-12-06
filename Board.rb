#this class will handle the board logic and state

class Board

  def initialize
    @rows_map = {"A" => 0, "B" => 1, "C" => 2}
    @columns_map = {"1" => 0, "2" => 1, "3" => 2}
    @board = [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ]
  end


  def updateBoard(row, column, marker)
    @board[row][column] = marker
  end

  def display
    #print board
    puts "
    #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}
    ---------
    #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} 
    ---------
    #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}
    "
  end
  
end