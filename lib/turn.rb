require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_setup'
require 'pry'

class Turn
  # attr_reader :board_computer, :board_player, :cruiser_computer, :cruiser_computer, :submarine_computer, :cruiser_player, :submarine_player
  # attr_accessor :board_player
  #
  # def initialize(game_setup)
  #   @board_computer = board_computer
  #   # @board_computer = board_computer
  #   @cruiser_computer = cruiser_computer
  #   @submarine_computer = submarine_computer
  # #   @new_placement = []
  #   @board_player = board_player
  #   @cruiser_player = cruiser_player
  #   @submarine_player = submarine_player
  #   # @cruiser_computer = comp_cruiser
  #   # @submarine_computer = comp_sub
  #   # @cruiser_player = player_cruiser
  #   # @submarine_player = player_sub
  # end

  attr_reader :board_computer, :player_board

  def initialize(comp_board, player_board)
    @board_computer = comp_board
    @board_player = player_board
  end

  def turn_flow
    # binding.pry
    # until player_ships_health || computer_ships_health == [0, 0]
    loop do
      player_shot
      computer_shot
      if player_ships_health || computer_ships_health == [0, 0]
        break
      end
    end
    puts player_ships_health
  end

  def player_ships_health
    [@cruiser_player.health,
    @submarine_player.health]
  end
  #
  def computer_ships_health
    [@cruiser_computer.health,
     @submarine_computer.health]
  end

  def player_shot
    puts "It is your turn to OPEN FIRE! Please enter one coordinate for your shot:"
    @player_input = gets.chomp
    if @board_computer.cells.has_key?(@player_input)
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
      shot =   fired_upon_check2
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


# Turn.new.initialize(GameSetup.new)
# Turn.new.player_shot
# Turn.new.computer_shot
# Turn.new.turn_flow





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
