require './lib/ship'
require 'pry'

class Cell

  attr_reader :coordinate, :ship, :fired_at, :render

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_at = false
    # @reader = render
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
    if @ship != nil
      @ship.hit
    end
    @fired_at = true
  end

  def render(always_reveal = false)
    if fired_upon? == false
      if always_reveal == true && !empty?
        'S'
      else
        '.'
      end
    elsif empty?
      'M'
    elsif !empty? && ship.sunk? == false
      'H'
    else
      'X'
    end
  end


end
