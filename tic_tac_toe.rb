# rubocop:disable all
# Defines the Board object
class Board
  attr_reader :round

  def initialize
    #@board = Array['1', '2', '3', '4', '5', '6', '7', '8', '9']
    #@board = Array.new(9, '.')
    @board = Array.new(3, Array.new(3,'.'))
    @round = 1
    @turn = 1
  end

  def display
    puts ''
    puts '  A B C'
    puts "1 #{@board[0][0]}|#{@board[0][1]}|#{@board[0][2]}"
    puts "2 #{@board[1][0]}|#{@board[1][1]}|#{@board[1][2]}"
    puts "3 #{@board[2][0]}|#{@board[2][1]}|#{@board[2][2]}"
    puts ''
  end



  def next_round()
    @round += 1
  end
end

# Defines Player Class
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

#Program Methods


def get_selection(board,player)
  valid_selection = false
  puts "Round #{board.round} - #{player.name}"
  board.display
  while not valid_selection
    puts 'Enter your selection (Column/row)'
    selection = gets.chomp.split('')
    if selection[0].upcase! >= 'A' && selection[0] <= 'C' then
      valid_selection = true
      selection
    else
      puts "Invalid Selection - Please enter using the format \"A1\"\n"
    end
  end

end



#Convert
def convert_selection
end

board = Board.new

puts 'Welcome to Tic-Tac-Toe!'
puts ''
#sleep(1)
#puts 'Player 1, enter your name:'
#player1 = Player.new(gets.chomp,'X')
#puts 'Player 2, enter your name:'
#player2 = Player.new(gets.chomp,'O')
#sleep(1)
#puts ''
player1 = Player.new("Biffington" , 'X')
player2 = Player.new("Houndsworth" , ')')


puts "#{player1.name} VS #{player2.name} BEGIN"
#sleep(1)
puts ''
puts ''
selection = get_selection(board,player1)
p selection


# rubocop:enable all