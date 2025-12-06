#this class will handle the board logic and state

class Board
  attr_reader :rows_map, :columns_map
  def initialize
    @rows_map = {"A" => 0, "B" => 1, "C" => 2}
    @columns_map = {"1" => 0, "2" => 1, "3" => 2}
    @board = [
      [" ", " ", " "],
      [" ", " ", " "],
      [" ", " ", " "]
    ]
  end


  def update_board(row, column, marker)
    @board[row][column] = marker
    true
  end

  def display
    #print board
    puts "
     |  1   2   3
   -----------------
 A |  #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} 
   -----------------
 B |  #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} 
   -----------------
 C |  #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} 
   -----------------
  "
  end

  def get_board
    return @board
  end
end