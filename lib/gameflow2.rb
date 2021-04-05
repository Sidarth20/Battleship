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
    @board_player = Board.new
    @cruiser_player = Ship.new("Cruiser", 3)
    @submarine_player = Ship.new("Submarine", 2)
  end

  def welcome_screen
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."

    user_input = gets.chomp
    if user_input == 'p'
      puts "May the odds be ever in your favor."
    # elsif user_input == "\n"
    #   puts "Please enter p or q"
    else
      puts "Have a good day!"
    end



  def computer_turn_setup(ship, location = @new_placement)
    invalid = true #setting flag to track sates of something
    while invalid do
      new_placement_helper
      passed = validation(ship)
      if passed
        invalid = false
      end
    end
    board_computer.place(cruiser_computer, location)
    board_computer.render(true)
  end

  def new_placement_helper
   keys = @board_computer.cells.keys
   until @new_placement.length == @cruiser_computer.length
     @new_placement << keys.sample
   end
 end

 def validation(ship)
   @board_computer.valid_placement?(@cruiser_computer, @new_placement)
 end

 # JOANNA'S TINKERING FUN TIME
 #inifinite loop
 #if odds are too low of getting a random valid placement
 # nested array of valid placements - rows and columns
 #FOR CRUISER
 # keys = @board_computer.cells.keys
 # letters = keys.map{|key| key.split('').first}
 # numbers = keys.map{|key|key.split('').last}
 # pre__validation = Array.new(@cruiser_computer.length)
 # # MAYBE have a nested collection:
 # # => hash w/ 2 keys: :horizontal & :vertical
 # # =>   { :horizontal => [nested array w/ arrays of valid horizonal placements],
 # # =>     :vertical => nested array w/ arrays of valid vertical placements]
 # # =>   }
 # # OR
 # # maybe more simply just one, big nested array
 # giant_nested_array = []
 #
 # def comp_generator_params(letters, numbers)
 #   keys = @board_computer.cells.keys
 #   letters = keys.map{|key| key.split('').first}
 #   numbers = keys.map{|key|key.split('').last}
 #   pre__validation = Array.new(@cruiser_computer.length)
 #   @computer_board
 #   INCOMPLETE
 # end

  #is consecutive_check(numbers) needed









 def player_instructions
   puts "I have laid out my ships on the grid."
   puts "You now need to lay out your two ships."
   puts "The Cruiser is three units long and the Submarine is two units long."
   board_computer.render
   puts "Enter the squares for the Cruiser (3 spaces):"
   cruiser_squares = gets.chomp
   cruiser_location = cruiser_squares.to_a
   board_player.valid_placement(cruiser_player, cruiser_location)
   while board_player.valid_placement(cruiser_player, cruiser_location) == false
     puts "Those are invalid coordinates. Please try again:"
     cruiser_squares = gets.chomp
     cruiser_location = cruiser_squares.to_a
   end
   board_player.render(true)
   puts "Enter the squares for the Submarine (2 spaces):"
   submarine_squares = gets.chomp
   sub_location = submarine_squares.to_a
   board_player.valid_placement(submarine_player, sub_location)
   while board_player.valid_placement(submarine_player, sub_location) == false
     puts "Those are invalid coordinates. Please try again:"
     submarine_squares = gets.chomp
     sub_location = submarine_squares.to_a
   end
   board_player.place(submarine_player, sub_location)
 end



end
end

Gameflow.new.welcome_screen
Gameflow.new.computer_turn_setup(@cruiser_computer, location = @new_placement)
# Gameflow.new.new_placement_helper
