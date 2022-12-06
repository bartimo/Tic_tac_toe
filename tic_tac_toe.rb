# Defines the Game object
class Game
  attr_accessor :round

  def initialize
    @round = 1
  end
end

# Defines the Board object
class Board
  def initialize
    @board = Array['1', '2', '3', '4', '5', '6', '7', '8', '9']
  end

  def display
    puts '  A B C'
    puts "1 #{@board[0]}|#{@board[1]}|#{@board[2]}"
    puts "2 #{@board[3]}|#{@board[4]}|#{@board[5]}"
    puts "3 #{@board[6]}|#{@board[7]}|#{@board[8]}"
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

def display_intro

end

game = Game.new
board = Board.new

puts 'Welcome to Tic-Tac-Toe!'
puts ''
sleep(1)
puts 'Player 1, enter your name:'
player1 = Player.new(gets.chomp,'X')
puts 'Player 2, enter your name:'
player2 = Player.new(gets.chomp,'O')
sleep(1)
puts ''
puts "#{player1.name} VS #{player2.name} BEGIN"
sleep(1)
puts ''
puts "Turn #{game.round} - #{player1.name}"
puts ''
board.display
