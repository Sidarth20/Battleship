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
end
