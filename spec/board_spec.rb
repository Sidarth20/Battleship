require 'rspec'
require './lib/ship'
require './lib/cell'
require './lib/board'
require 'pry'


RSpec.describe 'Board' do
  it 'exists' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it 'has cells' do
    board = Board.new
    expect(board.cells.count).to eq(16)
  end

  it 'validates coordinates' do
    board = Board.new
    expect(board.valid_coordinate?("A1")).to eq(true)
    expect(board.valid_coordinate?("D4")).to eq(true)
    expect(board.valid_coordinate?("A5")).to eq(false)
    expect(board.valid_coordinate?("E1")).to eq(false)
    expect(board.valid_coordinate?("A22")).to eq(false)
  end

it 'validates placements' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    expect(board.valid_placement?(cruiser, ["A1", "A2"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "A3", "A4"])).to eq(false)

    # checks for true horizontal placement
    expect(board.valid_placement?(cruiser, ["A1", "A2", "A3"])).to eq(true)
    expect(board.valid_placement?(submarine, ["A2", "A3"])).to eq(true)
    # checks for false horizontal placement
    expect(board.valid_placement?(cruiser, ["B1", "A2", "A3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["B2", "A3"])).to eq(false)

    #checks for true vertical placement
    expect(board.valid_placement?(cruiser, ["A1", "B1", "C1"])).to eq(true)
    expect(board.valid_placement?(submarine, ["A2", "B2"])).to eq(true)
    #checks for false vertical placement
    expect(board.valid_placement?(cruiser, ["A2", "B1", "C1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A2", "B3"])).to eq(false)

  end

  it 'validates placements are consecutive' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to eq(false)
    expect(board.valid_placement?(submarine, ["A1", "C1"])).to eq(false)
    expect(board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C1", "B1"])).to eq(false)
  end

  it 'validates placements are not diagonal' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to eq(false)
    expect(board.valid_placement?(submarine, ["C2", "D3"])).to eq(false)
  end

  it 'has valid placement' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)

    expect(board.valid_placement?(submarine, ["A1", "A2"])).to eq(true)
    expect(board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to eq(true)
  end

  it 'places ship & cells' do
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)

    board.place(cruiser, ["A1", "A2", "A3"])

    cell_1 = board.cells["A1"]
    cell_2 = board.cells["A2"]
    cell_3 = board.cells["A3"]

    cell_1.ship
    cell_2.ship
    cell_3.ship
    binding.pry
    expect(cell_3.ship == cell_2.ship).to eq(true)
  end
end
