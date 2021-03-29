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
