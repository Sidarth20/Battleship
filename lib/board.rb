require './lib/ship'
require './lib/cell'
require 'pry'

class Board
  attr_reader :cells

  def initialize
    @cells = grid
  end

  def grid
    {
      "A1" =>  Cell.new("A1"), "A2" =>  Cell.new("A2"),"A3" =>  Cell.new("A3"),"A4" =>  Cell.new("A4"),"B1" =>  Cell.new("B1"),
      "B2" =>  Cell.new("B2"),"B3" =>  Cell.new("B3"),"B4" =>  Cell.new("B4"),"C1" =>  Cell.new("C1"),  "C2" =>  Cell.new("C2"),
      "C3" =>  Cell.new("C3"), "C4" =>  Cell.new("C4"), "D1" =>  Cell.new("D1"), "D2" =>  Cell.new("D2"), "D3" =>  Cell.new("D3"),
      "D4" =>  Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end

  def consecutive_check(values)
    values == (values.min..values.max).to_a && values.count == values.length
  end

  def horizontal_check(letters, numbers)
    is_horizontal = letters.uniq.length == 1
    return false unless is_horizontal
    consecutive_check(numbers)
  end

  def vertical_check (letters, numbers)
    is_vertical = numbers.uniq.length == 1
    return false unless is_vertical
    letters_to_nums = letters.map { |letter| letter.ord }
    consecutive_check(letters_to_nums)
  end

  def overlaps(location)
    location.each do |item|
      if not cells[item].empty?
        return true
      end
    end
    return false
  end

  def valid_placement?(ship, location)
    letters = location.map{|letter|letter.split('').first}
    numbers = location.map{|number|number.split('').last}
    # binding.pry
    ship.length == location.length && !overlaps(location) && (horizontal_check(letters, numbers) || vertical_check(letters, numbers))
  end

  def place(ship, location)
    values = cells.values
    keys = cells.keys

    location.find_all do |string|
      values.find_all do |value|
        if value.coordinate == string
          value.place_ship(ship)
        end
      end
    end
    values
  end

  def render(always_reveal = false)
    values = cells.values
    if always_reveal == true
      string = values.map do |cell|
        cell.render(true)
      end
    else string = values.map do |cell|
      cell.render
    end
  end
  string

  puts spaces = "  1 2 3 4 \n" +
             "A #{string[0]} #{string[1]} #{string[2]} #{string[3]} \n" +
             "B #{string[4]} #{string[5]} #{string[6]} #{string[7]} \n" +
             "C #{string[8]} #{string[9]} #{string[10]} #{string[11]} \n" +
             "D #{string[12]} #{string[13]} #{string[14]} #{string[15]} \n"
  end

end
