require 'rspec'
require './lib/ship'
require './lib/cell'
require 'pry'

RSpec.describe Cell do
  it 'exists' do
    cell = Cell.new("B4")

    expect(cell).to be_instance_of(Cell)
  end

  it 'has a ship' do
    cell = Cell.new("B4")

    cell.ship
    expect(cell.ship).to eq(nil)
  end

  it 'is empty' do
    cell = Cell.new("B4")

    cell.empty?
    expect(cell.empty?).to eq(true)
  end

  it 'has a ship' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.ship).to eq(cruiser)
  end

  it 'is no longer empty' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.empty?).to eq(false)
  end
end
