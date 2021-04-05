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

    #computer_setup
    # binding.pry
    keys = board_computer.cells.keys
    new_placement = keys.sample(cruiser_computer.length, random: Random.new(1)) do |key|
      board_computer.place(cruiser_computer, key)
    end
    #Now I need to iterate to get valid placement location. Once the location works,
    #Can pass that location to board_computer.place for cruiser. then reiterate for sub
    location = new_placement
    if board_computer.valid_placement?(cruiser_computer, location) == false
      #How do I reiterate lines 39-40 below to keep generating placements until valid_placement == true?
      new_placement = keys.sample(cruiser_computer.length, random: Random.new(1)) do |key|
        board_computer.place(cruiser_computer, key)
      end
    else
        board_computer.place(cruiser_computer, key)
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
