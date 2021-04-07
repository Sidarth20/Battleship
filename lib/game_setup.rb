require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class GameSetup

  attr_reader :cruiser_computer, :submarine_computer, :cruiser_player, :submarine_player, :board_computer, :board_player
  attr_accessor :board_computer, :board_player

  def initialize(comp_board, player_board, comp_cruiser, comp_sub, player_cruiser, player_sub)
    # @board_computer = Board.new
    @board_computer = comp_board
    # @board_player = Board.new
    @board_player = player_board
    @cruiser_computer = comp_cruiser
    # @cruiser_computer = Ship.new("Cruiser", 3)
    @submarine_computer = comp_sub
    # @submarine_computer = Ship.new("Submarine", 2)
    @cruiser_player = player_cruiser
    # @cruiser_player = Ship.new("Cruiser", 3)
    @submarine_player = player_sub
    # @submarine_player = Ship.new("Submarine", 2)
    @new_placement = []
    @computer_array = viable_ship_placment
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
  end

  #for welcome message  elsif "q" exit out, else "Please input 'p' or 'q'"

  def computer_turn_setup(ship, location)
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
  end

  # IF TIME allow for edge case of lower case input
 def player_instructions
   puts "I have laid out my ships on the grid."
   puts "You now need to lay out your two ships."
   puts "The Cruiser is three units long and the Submarine is two units long."
   @board_computer.render
   puts "Enter the squares for the Cruiser (3 spaces):"
   cruiser_squares = gets.chomp
   cruiser_location = cruiser_squares.split()
   @board_player.valid_placement?(@cruiser_player, cruiser_location)
   while @board_player.valid_placement?(@cruiser_player, cruiser_location) == false
     puts "Those are invalid coordinates. Please try again:"
     cruiser_squares = gets.chomp
     cruiser_location = cruiser_squares.split()
   end
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
 end

 def display_boards #FIX  - NOT DISPLAYING
   puts "=================COMPUTER BOARD================="
   @board_computer.render(true)

   puts "=================PLAYER BOARD================="
   @board_player.render(true)
 end

 def viable_ship_placment
   [['A1', 'A2', 'A3'], ['A2', 'A3', 'A4'],
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
 end


 # def player_shot
 #   puts "It is your turn to OPEN FIRE! Please enter one coordinate for your shot:"
 #   @player_input = gets.chomp
 #   if @board_player.cells.has_key?(@player_input)
 #     shot = fired_upon_check2
 #     shot.fire_upon
 #     puts "You fired upon coordinate #{@player_input}"
 #   else
 #     loop do
 #       puts "You did not enter a valid coordinate. Please enter a valid coordinate:"
 #       @player_input2 = gets.chomp
 #       if @board_player.cells.has_key?(@player_input2)
 #         break
 #       end
 #     end
 #     shot = fired_upon_check2
 #     puts "You fired upon coordinate #{@player_input2}"
 #   end
 # end
 #
 # def computer_shot
 #   puts "I, The Almighty Computer, will now shoot my shot upon..."
 #   shot = fired_upon_check1
 #   shot.fire_upon
 #   puts "coordinate #{shot.coordinate}"
 # end
 #
 # def fired_upon_check1 #for computer on player board - better name
 #   @computer_guess = @board_player.cells.keys.sample
 #   @board_player.cells.values.find do |cell|
 #      !cell.fired_upon? && cell.coordinate == @computer_guess
 #    end
 #  end
 #
 #  def fired_upon_check2 #for player on computer board - better name
 #    @board_computer.cells.values.find do |cell|
 #       !cell.fired_upon? && cell.coordinate == @player_input || @player_input2
 #     end
 #  end






end


# Gameflow.new.initialize #((comp_cruiser = Ship.new("Cruiser", 3)), (comp_sub = Ship.new("Submarine", 2)), (player_cruiser = Ship.new("Cruiser", 3)), (player_sub = Ship.new("Submarine", 2)))
# GameSetup.new.welcome_screen
# GameSetup.new.computer_turn_setup(@cruiser_computer, location = @new_placement)
# GameSetup.new.player_instructions
# GameSetup.new.display_boards
# Gameflow.new.player_shot
# Gameflow.new.computer_shot
