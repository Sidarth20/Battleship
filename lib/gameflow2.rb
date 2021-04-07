require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

class Gameflow

  def initialize
    @board_computer = Board.new
    @cruiser_computer = Ship.new("Cruiser", 3)
    @submarine_computer = Ship.new("Submarine", 2)
    @new_placement = []
    @computer_array = [['A1', 'A2', 'A3'], ['A2', 'A3', 'A4'],
                       ['B1', 'B2', 'B3'], ['B2', 'B3', 'B4'],
                       ['C1', 'C2', 'C3'], ['C2', 'C3', 'C4'],
                       ['D1', 'D2', 'D3'], ['D2', 'D3', 'D4'],
                       ['A1', 'B1', 'C1'], ['B1', 'C1', 'D1'],
                       ['A2', 'B2', 'C2'], ['B2', 'C2', 'D2'],
                       ['A3', 'B3', 'C3'], ['B3', 'C3', 'D3'],
                       ['A4', 'B4', 'C4'], ['B4', 'C4', 'D4'],
                       ['A1', 'A2'],['A2', 'A3'],['A3', 'A4'],
                       ['B1', 'B2'],['B2', 'B3'],['B3', 'B4'],
                       ['C1', 'C2'],['C2', 'C3'],['C3', 'C4'],
                       ['D1', 'D2'],['D2', 'D3'],['D3', 'D4'],
                       ['A1', 'B1'],['B1', 'C1'],['C1', 'D1'],
                       ['A2', 'B2'],['B2', 'C2'],['C2', 'D2'],
                       ['A3', 'B3'],['B3', 'C3'],['C3', 'D3'],
                       ['A4', 'B4'],['B4', 'C4'],['C4', 'D4']]
    @board_player = Board.new
    @cruiser_player = Ship.new("Cruiser", 3)
    @submarine_player = Ship.new("Submarine", 2)
  end

  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."

    user_input = gets.chomp
    if user_input == 'p'
      puts "May the odds be ever in your favor."
    # elsif user_input == "\n"
    #   puts "Please enter p or q"
  else user_input == 'q'
      puts "Have a good day!"
      exit
    end

    puts "\n"
    #computer_board_setup
    cruiser_options = @computer_array.find_all do |element|
      element.length == @cruiser_computer.length
    end
    @board_computer.place(@cruiser_computer, cruiser_options.sample)
    submarine_options = @computer_array.find_all do |element|
      element.length == @submarine_computer.length
    end
    if @board_computer.valid_placement?(@submarine_computer, submarine_options.sample) == false
      submarine_options = @computer_array.find_all do |element|
        element.length == @submarine_computer.length
      end
    else
      @board_computer.place(@submarine_computer, submarine_options.sample)
    end

    #player_instructions
  # IF TIME allow for edge case of lower case input
   puts "I have laid out my ships on the grid."
   puts "You now need to lay out your two ships."
   puts "The Cruiser is three units long and the Submarine is two units long."
   @board_computer.render
   puts "Enter the squares for the Cruiser (3 spaces):"
   cruiser_squares = gets.chomp
   cruiser_location = cruiser_squares.split()
   puts "\n"
   @board_player.valid_placement?(@cruiser_player, cruiser_location)
   while @board_player.valid_placement?(@cruiser_player, cruiser_location) == false
     puts "Those are invalid coordinates. Please try again:"
     cruiser_squares = gets.chomp
     cruiser_location = cruiser_squares.split()
   end
   puts "\n"
   @board_player.place(@cruiser_player, cruiser_location)
   @board_player.render(true)
   puts "Enter the squares for the Submarine (2 spaces):"
   submarine_squares = gets.chomp
   sub_location = submarine_squares.split()
   @board_player.valid_placement?(@submarine_player, sub_location)
   while @board_player.valid_placement?(@submarine_player, sub_location) == false
     puts "Those are invalid coordinates. Please try again:"
     submarine_squares = gets.chomp
     sub_location = submarine_squares.split()
   end
   @board_player.place(@submarine_player, sub_location)
   @board_player.render(true)
   # this shows that the cells have ships in them
   # @board_player.cells.values

   puts "\n\n\n"

   #displays board
   puts "=================COMPUTER BOARD================="
   @board_computer.render(true)

   puts "=================PLAYER BOARD================="
   @board_player.render(true)

   puts "\n"

   #player_shot
   puts "It is your turn to OPEN FIRE! Please enter one coordinate for your shot:"
   player_input = gets.chomp
   # binding.pry
   if @board_player.cells.has_key?(player_input)
   # if player_input == @board_player.valid_coordinate?(player_input)
     puts "You fired upon coordinate #{player_input}"
   else
   # elsif player_input != @board_player.valid_coordinate?(player_input)
     # puts "You did not enter a valid coordinate. Please enter a valid coordinate:"
     # player_input = gets.chomp
     loop do
       puts "You did not enter a valid coordinate. Please enter a valid coordinate:"
       player_input = gets.chomp
       if @board_player.cells.has_key?(player_input)
         break
       end
     end
     puts "You fired upon coordinate #{player_input}"
   end

   #RESULTS
   #player_results:
   #if @coordinate in the array @board_computer.cells.values != player_input
    #puts "Your shot on #{player_input} was a miss"
   #else
    #if @ship.health > 1
      #puts "Your shot on #{player_input} was a hit"
    #else @ship.health < 1
      #puts "Your shot on #{player_input} has sunk a ship"
    #end
   #end

   #computer_results:
   #if @coordinate in the array @board_player.cells.values != computer_guess
    #puts "Your shot on #{computer_guess} was a miss"
   #else
    #if @ship.health > 1
      #puts "Your shot on #{computer_guess} was a hit"
    #else @ship.health < 1
      #puts "Your shot on #{computer_guess} has sunk a ship"
    #end
   #end

   #END GAME
   #if @board_player.cells.values @ship.health < 1 for all ships
    #puts "I won!"
   #else @board_computer.cells.values @ship.health < 1 for all ships
    #puts "You won!"
   #end
   #  puts "Welcome to BATTLESHIP"
   #   puts "Enter p to play. Enter q to quit."
   #
   #   user_input = gets.chomp
   #   if user_input == 'p'
   #     puts "May the odds be ever in your favor."
   #   # elsif user_input == "\n"
   #   #   puts "Please enter p or q"
   # else user_input == 'q'
   #     puts "Have a good day!"
   #     exit
   #   end

 end

# def computer_shot
#   puts "The computer is choosing a coordinate to fire upon."
#   computer_initial_guess = @board_computer.cells.keys.sample
#   @board_computer.cells.values.fire_upon
#
# end
#




end
Gameflow.new.start


# Gameflow.new.welcome_screen
# Gameflow.new.computer_turn_setup(@cruiser_computer, location = @new_placement)
# Gameflow.new.player_instructions
# Gameflow.new.display_boards
# Gameflow.new.player_shot
# Gameflow.new.computer_shot



#Turn
# allow turns to alternate  - who shall go first (user/player or comp - looks like player)?
# maybe before displaying board we print some brief firing instructions?
# 1. display 2 boards - computer + player
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
    # decide where/when to print results (shot missed/hit/sunk) - after each shot?







# invalid = true #setting flag to track sates of something
 # while invalid do
 #   new_placement_helper
 #   passed = validation(ship)
 #   if passed
 #     invalid = false
 #   end
#end
