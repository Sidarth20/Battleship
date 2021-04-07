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
    puts "It is your turn to OPEN FIRE! Please enter one coordinate for your shot:
          "
    @player_input = gets.chomp
    if @board_computer.cells.has_key?(@player_input)
      shot = fired_upon_check2
      shot.fire_upon
      puts "You fired upon coordinate #{@player_input}
            "
    else
      loop do
        puts "You did not enter a valid coordinate. Please enter a valid coordinate:
              "
        @player_input2 = gets.chomp
        if @board_player.cells.has_key?(@player_input2)
          break
        end
      end
      shot =   fired_upon_check2
      puts "You fired upon coordinate #{@player_input2}
            "
    end
  end

  def computer_shot
    puts "I, The Almighty Computer, will now shoot my shot upon...
          "
    shot = fired_upon_check1
    shot.fire_upon
    puts "coordinate #{shot.coordinate}
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

 end
