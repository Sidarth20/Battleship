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
    else
      puts "Have a good day!"
    end
  end

  welcome_screen
  #if welcome_screen's user_input == 'p'
  #go into setup method

  def setup
    
  end

# end
