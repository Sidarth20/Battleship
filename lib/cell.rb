class Cell
  require 'pry'
  attr_reader :coordinate, :ship, :fired_at

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_at = false
  end

  def empty?
    return true if @ship == nil
    false
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    if !empty?
      return false if @ship.health == ship.length
      true
    else
      return false if fired_at != true
      true
    end
  end

  def fire_upon
    @fired_at = true
    if !empty?
      ship.hit
    end
  end


  def render
    if fired_upon? == false
      "."
    elsif fired_upon? && empty?
      "M"
    # elsif fired_upon? == true && ship.sunk? == true
    #   "X"
    # elsif fired_upon? == true && empty? == false
    #   "H"
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

  #
