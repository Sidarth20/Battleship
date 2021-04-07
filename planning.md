# This will be our Planning Document for the Battleship Project.

# Types of Classes:

# Ship Class
  # Attributes:
      #name, length, health
  # Methods:
      #sunk?, hit

# Cell Class
  #Attributes:
    #coordinate
  #Methods:
    #ship, empty?, place_ship, fired_upon?, fire_upon, render
  #Notes: Return "H"(hit), "M"(miss), "."(not been fired upon), "X"(fired upon & sunk), "S"(not been fired upon & contains a ship)

# Board Class:
  #Attributes:

  #Methods:
    #cells(hash), valid_coordinate?(Ship, coordinates), place(ship, coordinates), valid_placement?, render(pulls up board visual at any time)
  #Notes: Ships can only be vertical or horizontal. Use Range Class for validation testing. Ord method for Strings
  #Helpful Enumerables: each_cons, any?, all?, none?

  #Iteration 3:

  #Game Class
  # will be used as a runner file to run the Battleship game

  #You now need to lay out your two ships. They need to be placed vertically or horizontally. They cannot be diagonally placed.

  # invalid_input_prompt = "Enter the squares for the Submarine (2 spaces):
  # > C1 C3
  # Those are invalid coordinates. Please try again:
  # > A1 B1
  # Those are invalid coordinates. Please try again:
  # > C1 D1"
  #placing_instructions = I have laid out my ships on the grid.
  # You now need to lay out your two ships.
  # "The Cruiser is three units long and the Submarine is two units long.
  #   1 2 3 4
  # A . . . .
  # B . . . .
  # C . . . .
  # D . . . .
  # Enter the squares for the Cruiser (3 spaces):
  # >"

  1:32
  # user_input = gets.chomp
  # if user_input passes placement checks
    #   place cells/input on board/grid where it matches (could probably use keys or values)
    # else invaid input prompt


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
