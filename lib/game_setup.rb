require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'

class GameSetup

  attr_reader :board_computer,
              :player_board,
              :player_cruiser,
              :player_sub,
              :comp_cruiser,
              :comp_sub
  # attr_accessor :board_computer, :board_player

  def initialize(comp_board, player_board, comp_cruiser, comp_sub, player_cruiser, player_sub)
    @board_computer = comp_board
    @board_player = player_board
    @cruiser_computer = comp_cruiser
    @submarine_computer = comp_sub
    @cruiser_player = player_cruiser
    @submarine_player = player_sub
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
      exit
    end
  end

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
   puts "I have laid out my ships on the grid.
        "
   puts "You now need to lay out your two ships."
   puts "The Cruiser is three units long and the Submarine is two units long.
        "
   @board_computer.render
   puts "Enter the squares for the Cruiser (3 spaces):
        "
   cruiser_squares = gets.chomp
   cruiser_location = cruiser_squares.split()
   @board_player.valid_placement?(@cruiser_player, cruiser_location)
   while @board_player.valid_placement?(@cruiser_player, cruiser_location) == false
     puts "Those are invalid coordinates. Please try again:
          "
     cruiser_squares = gets.chomp
     cruiser_location = cruiser_squares.split()
   end
   @board_player.place(@cruiser_player, cruiser_location)
   @board_player.render(true)
   puts "Enter the squares for the Submarine (2 spaces):
        "
   submarine_squares = gets.chomp
   sub_location = submarine_squares.split()
   @board_player.valid_placement?(@submarine_player, sub_location)
   while @board_player.valid_placement?(@submarine_player, sub_location) == false
     puts "Those are invalid coordinates. Please try again:
          "
     submarine_squares = gets.chomp
     sub_location = submarine_squares.split()
   end
   @board_player.place(@submarine_player, sub_location)
   @board_player.render(true)
 end

 def display_boards #FIX  - NOT DISPLAYING
   puts "=================COMPUTER BOARD=================
        "
   @board_computer.render(true)

   puts "=================PLAYER BOARD=================
        "
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


end
