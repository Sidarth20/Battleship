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

  def horizontal_check(ship, location)
    if location[0].ord == location[1].ord
      numbers = location.map do |cell|
        cell.split('').last.to_i
      end
      if ship.length == 3
        numbers.each_cons(3).find do |num1, num2, num3|
          if (num2 - num1 == 1) && (num3 - num2 == 1)
            true
          else
            false
          end
        end
      else
        numbers.each_cons(2).find do |num1, num2|
          num2 - num1 == 1
        end
      end
    end
  end

  def vertical_check (ship, location)
    if location[0].ord != location[1].ord
      letters = location.map do |cell|
        cell.split.first.ord
      end
      if ship.length == 3
        letters.each_cons(3).find do |num1, num2, num3|
          if (num2 - num1 == 1) && (num3 - num2 == 1)
            true
          else
            false
          end
        end
      else
        letters.each_cons(2).find do |num1, num2|
          num2 - num1 == 1
        end
      end
    end
  end

  def valid_placement?(ship, location)
    return true if ship.length == location.length && horizontal_check(ship, location) || vertical_check(ship, location)
    false
  end
end

#   def valid_placement?(ship, location)
#     if ship.length == location.length
#     #horizontal
#       if location[0].ord == location[1].ord
#         numbers = location.map do |cell|
#           cell.split('').last.to_i
#         end
#         numbers.each_cons(ship.length).find do |num1, num2|
#           num2 - num1 == 1
#         end
#     #vertical
#       else letters = location.map do |cell|
#         cell.split.first.ord
#         end
#         letters.each_cons(ship.length).find do |num1, num2|
#           num2 - num1 == 1
#         end
#       end
#     end
#     false
#   end
# end
