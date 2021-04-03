class Board

  def initialize
    @cells = cells
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

  def valid_placement?(ship, location)
    letters = location.map{|letter|letter.split('').first}
    numbers = location.map{|number|number.split('').last}
    return true if ship.length == location.length && horizontal_check(letters, numbers) || vertical_check(letters, numbers)
    false
  end

  def place(ship, location)
    values = cells.values
    keys = cells.keys
    #check if location is included within keys array
    if keys.include?(location[0]) && keys.include?(location[1]) || keys.include?(location[2])
    #how to place ship in the values array with the coordinate attribute
    #check if coordinate matches location value,
    # place_ship(ship) into cell
    values.find do |value|
      value.coordinate == location #get into string
        values.each do |value|
          values.place_ship(ship)
        end

    # cells.values.place_ship(ship)
    # binding.pry
    # if cell_1 @coordinate == cells[key]
    #   cell_1.place_ship(ship)
    #
    # keys = []
    # cells.each_key{|cell| keys << cell}
    # keys
    # Need comparison between board.cells["A1"] == keys array
    #
    # values = []
    # cells.each_value do |cell|
    #   if cell_1 == cells.values
    #     values << cell.values.place_ship(ship)
    #   end
    # end
    # values
    # end

    # placing Ship
    # values.first.place_ship(ship)
    # values.first
    #
    # until coordinates == ship.length
    # place ship into coordinates

  end

end
