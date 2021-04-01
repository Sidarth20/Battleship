class Board

  def initialize
  end

  def cells
    {
      "A1" => ".", "A2" => ".","A3" => ".","A4" => ".","A5" => ".",
      "A6" => ".","A7" => ".","A8" => ".","A9" => ".",  "A10" => ".",
      "A11" => ".", "A12" => ".", "A13" => ".", "A14" => ".", "A15" => ".",
      "A16" => "."
    }
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
