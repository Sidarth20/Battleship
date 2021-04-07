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
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    if !empty?
      if @ship.health == ship.length
        false
      else
        true
      end
    else
      if fired_at != true
        false
      else
        true
      end
    end
  end

  def fire_upon
    @fired_at = true
    if !empty?
      @ship.hit
    end
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
