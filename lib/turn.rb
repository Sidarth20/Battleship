require './lib/board'
require './lib/board'
require './lib/cell'
require './lib/ship'
# require './lib/game_setup'
require 'pry'

class Turn

  def initialize
    @board_computer = Board.new
    @cruiser_computer = Ship.new("Cruiser", 3)
    @submarine_computer = Ship.new("Submarine", 2)
    @new_placement = []
    @board_player = Board.new
    @cruiser_player = Ship.new("Cruiser", 3)
    @submarine_player = Ship.new("Submarine", 2)
  end


def turn_flow #player

end

def player_shot
  puts "It is your turn to OPEN FIRE! Please enter one coordinate for your shot:"
  @player_input = gets.chomp
  if @board_player.cells.has_key?(@player_input)
    shot = fired_upon_check2
    shot.fire_upon
    puts "You fired upon coordinate #{@player_input}"
  else
    loop do
      puts "You did not enter a valid coordinate. Please enter a valid coordinate:"
      @player_input2 = gets.chomp
      if @board_player.cells.has_key?(@player_input2)
        break
      end
    end
    shot = fired_upon_check2
    puts "You fired upon coordinate #{@player_input2}"
  end
end

def computer_shot
  puts "I, The Almighty Computer, will now shoot my shot upon..."
  shot = fired_upon_check1
  shot.fire_upon
  puts "coordinate #{shot.coordinate}"
end

def fired_upon_check1 #for computer on player board - better name
  @computer_guess = @board_player.cells.keys.sample
  @board_player.cells.values.find do |cell|
     !cell.fired_upon? && cell.coordinate == @computer_guess
   end
 end

 def fired_upon_check2 #for player on computer board - better name
   @board_computer.cells.values.find do |cell|
      !cell.fired_upon? && cell.coordinate == @player_input || @player_input2
    end
 end

end

Turn.new.player_shot
Turn.new.computer_shot





#
#   def initialize(guess, card)
#   @guess = guess
#   @card = card
# end
#
# def correct?
#   return true if @guess == @card.answer
#   false
# end
#
# def feedback
#   return "Correct!" if correct?
#   return "Incorrect."
# end

# allow turns to alternate   who shall go first (user/player or comp  looks like player)?
# maybe before displaying board we print some brief firing instructions?
# 1. display 2 boards  computer + player
    # p "=============COMPUTER BOARD============="
    # computer_board = Board.new
    # computer_board.render (not sure about this, just a guess)
    #
    # p "==============PLAYER BOARD=============="
    # player_board = Board.new
    # player_board.render
# 2. Player choosing a coordinate to fire on
    # print something like below (or whatever phrasing is most clear)
    # "It is your turn to OPEN FIRE! Please enter a coordinate to fire upon"
    # if user_input != a valid coordinate
        #loop prompt until user_input == valid coordinate
    # else (meaning is was input was valid coordinate )
        # maybe print confirmation message "You fired upon #{user_input}"
          #and then move to computer's turn/shot
    # decide where/when to print results (shot missed/hit/sunk)  after each shot?