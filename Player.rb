
#this will track whos turn it is
class Player
  attr_reader :player1, :player2
  def initialize(player1_name = "X", player2_name = "O")
    @player1 = player1_name
    @player2 = player2_name
  end

end