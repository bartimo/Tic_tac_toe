# rubocop:disable all
# Defines the Board object
class Board
  attr_reader :round

  def initialize
    @board = [['.', '.', '.'], ['.', '.', '.'], ['.', '.', '.']]
    @round = 1
    @turn = 1
    @game_history = []
  end

  def display
    puts ''
    puts '  A B C'
    puts "1 #{@board[0][0]}|#{@board[0][1]}|#{@board[0][2]}"
    puts "2 #{@board[1][0]}|#{@board[1][1]}|#{@board[1][2]}"
    puts "3 #{@board[2][0]}|#{@board[2][1]}|#{@board[2][2]}"
    puts ''
  end

  def is_valid_selection?(selection)
    valid = false
    unless selection.empty?
      if selection[0].between?('A', 'C') && selection[1].between?('1', '3') && selection.length == 2 
        valid = true
      end
    end 
    return valid
  end

  def is_legal_play?(selection)
    if  @board[selection[0]][selection[1]] == '.'
      return true
    else
      return false
    end
  end

  def to_num_array(selection)
    num_array = selection.clone
    num_array[0] = num_array[0].ord - 65
    num_array[1] = num_array[1].to_i - 1
    num_array
  end

  def place_selection(selection, player)
    if  @board[selection[1]][selection[0]] == '.'
      @board[selection[1]][selection[0]] = player.symbol
      return true
    else
      return false
    end
  end

  def found_winner?
    winning_string = "XXXOOO"

    p temp

  end 



  def save_history(selection)
    @game_history << selection
  end


  def next_turn
    @turn += 1
  end


end #Board

# Defines Player Class
class Player
  attr_reader :name, :symbol, :player_num

  def initialize(player_num, name, symbol)
    @player_num = player_num
    @name = name
    @symbol = symbol
  end
end



# Begin Program
board = Board.new
turn_end = false
game_end = false
valid_selection = true

#set players
player1 = Player.new(1, 'Biffington', 'X')
player2 = Player.new(2, 'Houndsworth', 'O')
current_player = player1
#display board

until game_end
  board.display
  puts "Player #{current_player.player_num} - #{current_player.name}: Enter your selection (Column/row)"
  #start turn
  turn_end = false
  until turn_end
  #get selection
    selection = gets.chomp.upcase.split('')
    unless board.is_valid_selection?(selection) then
      puts 'Invalid Selection - please enter using format "A1"'
    else  
        unless board.is_legal_play?(board.to_num_array(selection)) then
          puts "Position #{selection.join('')} is already ocupied. Please try again. "
        else
          board.place_selection(board.to_num_array(selection),current_player) 
          board.save_history(selection)
          game_end = board.found_winner?
          puts("game over: #{game_end}")
          board.next_turn
          turn_end = true
          current_player == player1 ? current_player = player2 : current_player = player1   
        end
    end

    #check for valid selection entry
    #convert selection to numbers
    #check for legal play
    #place square
    #check for win
    #change player
    #increment score counter
  #
  end #turn_end
end #game_end
# rubocop:enable all
