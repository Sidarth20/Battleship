class Board

  def initialize
  end

  def cells
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

  def valid_placement?(ship, location)
    ship.length == location.length
      if location.split.consecutive_numbers
    false

  end


  def split(location)
    location.map do |cell|
      cell.split('').last.to_i
    end
  end

  def consecutive_numbers(ship, location) #consider name
    location.each_cons(ship.length).find do |num1, num2|
      num2 - num1 == 1
    end
  end






end
#
#
# return true if ship.length == location.length
#   if location.each_cons(location.length) do |cell|
#
#
# false
# end
