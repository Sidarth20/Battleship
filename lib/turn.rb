require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_setup'
require 'pry'

class Turn
  attr_reader :board_computer,
              :player_board,
              :player_cruiser,
              :player_sub,
              :comp_cruiser,
              :comp_sub

  def initialize(comp_board, player_board, player_cruiser,
                player_sub, comp_cruiser, comp_sub)
    @board_computer = comp_board
    @board_player = player_board
    @cruiser_player = player_cruiser
    @submarine_player = player_sub
    @cruiser_computer = comp_cruiser
    @submarine_computer = comp_sub
  end

  def turn_flow
    while player_ships_health || computer_ships_health == [0, 0]
      player_shot
      computer_shot
      # player_results(ship)
      # computer_results(ship)
      # @new_game.display_boards
    end
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
    puts "It is your turn to OPEN FIRE! Please enter one coordinate for your shot:
          "
    @player_input = gets.chomp
    cell = fired_upon_check2
    if @board_computer.cells.has_key?(@player_input) || cell = nil
      #if fire uupon already - need to handle this (new guess)
      cell.fire_upon
      puts "You fired upon coordinate #{@player_input}
            "
    else
      # binding.pry
      loop do
        puts "You did not enter a valid coordinate. Please enter a valid coordinate:
              "
        @player_input2 = gets.chomp
        if @board_player.cells.has_key?(@player_input2)
          break
        end
      end
      cell = fired_upon_check2
      puts "You fired upon coordinate #{@player_input2}
            "
    end
  end

  def computer_shot
    puts "I, The Almighty Computer, will now shoot my shot upon...
          "
    cell = fired_upon_check1
    binding.pry
    cell.fire_upon
    puts "coordinate #{cell.coordinate}
          "
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

   def player_results(ship) #pass current shot in only
     @board_computer.cells.values.find do |cell|
       if (@player_input || @player_input2)!= cell.coordinate
         puts "Your shot on #{@player_input || @player_input2} was a miss"
       else
         if @ship.health > 1
           puts "Your shot on #{@player_input || @player_input2} was a hit"
         else @ship.health < 1
          puts "Your shot on #{@player_input || @player_input2} has sunk a ship"
         end
        end
      end
    end

    def computer_results(ship)
      @board_player.cells.values.find do |cell|
        if @computer_guess != cell.coordinate
          puts "Your shot on #{@computer_guess} was a miss"
        else
          if @ship.health > 1
            puts "Your shot on #{@computer_guess} was a hit"
          else @ship.health < 1
            puts "Your shot on #{@computer_guess} has sunk a ship"
          end
        end
      end
    end

 end
