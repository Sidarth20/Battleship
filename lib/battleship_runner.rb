require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/game_setup'
require './lib/turn'
require 'pry'

#ships
@comp_cruiser = Ship.new("Cruiser", 3)
@comp_sub = Ship.new("Submarine", 2)
@player_cruiser = Ship.new("Cruiser", 3)
@player_sub = Ship.new("Submarine", 2)

#boards
@comp_board = Board.new
@player_board = Board.new
#cells in boards

@new_game = GameSetup.new(@comp_board = Board.new,
                          @player_board = Board.new,
                          @comp_cruiser = Ship.new("Cruiser", 3),
                          @comp_sub = Ship.new("Submarine", 2),
                          @player_cruiser = Ship.new("Cruiser", 3),
                          @player_sub = Ship.new("Submarine", 2))

@new_game_turns = Turn.new(@comp_board = Board.new,
                           @player_board = Board.new, @player_cruiser = Ship.new("Cruiser", 3),
                            @player_sub = Ship.new("Submarine", 2), @comp_cruiser = Ship.new("Cruiser", 3),
                            @comp_sub = Ship.new("Submarine", 2))


def start_game_setup
  # @cruiser_computer
  # @submarine_computer
  # @cruiser_player
  # @submarine_player
  # @board_computer
  # @board_player
  # @new_game.initialize(@comp_board = Board.new,
                            # @player_board = Board.new,
                            # @comp_cruiser = Ship.new("Cruiser", 3),
                            # @comp_sub = Ship.new("Submarine", 2),
                            # @player_cruiser = Ship.new("Cruiser", 3),
                            # @player_sub = Ship.new("Submarine", 2))
  @new_game.welcome_screen
  @new_game.computer_turn_setup(@comp_cruiser, location = @new_placement)
  @new_game.player_instructions
  @new_game.display_boards
  # @new_game.viable_ship_placment
end

def start_turns
  @new_game_turns.player_shot
  @new_game_turns.turn_flow #(@comp_board)
  #issue with ship health in turn class, rb:49
end

start_game_setup
start_turns
