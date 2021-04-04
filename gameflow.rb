require './lib/board'
require './lib/cell'
require './lib/ship'
require 'pry'

# class Gameflow

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
  # end

  # def setup
    board_computer = Board.new
    cruiser_computer = Ship.new("Cruiser", 3)
    submarine_computer = Ship.new("Submarine", 2)

    puts "computer time"
    #computer_setup
    #need to generate random coordinates based on grid
    # with adhering to valid placement principles
    #^store above coordinates in computer_coordinates
    #then
    binding.pry
    keys = board_computer.cells.keys
    keys.sample(cruiser_computer.length, random: Random.new(1)) do |key|
    until board_computer.valid_placement?(cruiser_computer, location)
      new_placement = board_computer.place(cruiser_computer, key)
    end

  end

  welcome_screen
  # if user_input == 'p'
  #   setup
  # else
  #   welcome_screen
  # end
  #go into setup method



# end
