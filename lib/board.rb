class Board

  def initialize
  end

  def cells
    {
      "A1" => ".", "A2" => ".","A3" => ".","A4" => ".","B1" => ".",
      "B2" => ".","B3" => ".","B4" => ".","C1" => ".",  "C2" => ".",
      "C3" => ".", "C4" => ".", "D1" => ".", "D2" => ".", "D3" => ".",
      "D4" => "."
    }
  end

  def valid_coordinate?(coordinate)
    cells.has_key?(coordinate)
  end

end

# '.' - maybe explore default value
#
# def initialize
#     grid = {}
#     available_"."s = []#starts with an array of all the keys in the "."s hash
#   end
#
#   def setter(".")
#     # @hash = Hash.new(".")
#   end
# end
