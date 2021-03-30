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
    return false if @ship.health == ship.length
    true
  end

  def fire_upon
    ship.hit
  end

  def render
    if @ship == nil && @coordinate != coordinate
      "."
    elsif @ship == nil && @coordinate 
      "M"
    end
  end
end
