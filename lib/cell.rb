class Cell
  require 'pry'
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end

  def empty?
    return true if @ship == nil
    false
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    # PSEUDOCODE
    # if @ship is value && @coordinate = coordinate
      # ship has been hit & fired upon
    #elsif @ship = nil && @coordinate = coordinate
      #ship has been fired upon & it's a miss

    return false if @ship.health == ship.length
    true
  end

  def fire_upon
    self.fired_upon? == true
    if empty? == false
      ship.hit
    end
  end

end











  # def render(reveal_ships = nil)
  #   if show_ships == true && empty? == false
  #     "S"
  #   elsif fired_upon? == false
  #     "."
  #   elsif fired_upon? == true && empty? == true
  #     "M"
  #   elsif fired_upon? == true && ship.sunk? == true
  #     "X"
  #   elsif fired_upon? == true && empty? == false
  #     "H"
  #   end
  # end
  #
  # def render
  #   if @ship == nil && @coordinate != coordinate
  #     "."
  #   elsif @ship == nil && @coordinate
  #     "M"
  #   end
  # end
  #
