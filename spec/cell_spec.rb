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

  it 'is has been fired upon & not hit' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    expect(cell.fired_upon?).to eq(false)
  end

  it 'is has been fired upon & hit' do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)

    cell.place_ship(cruiser)

    cell.fire_upon
    expect(cell.ship.health).to eq(2)
    # binding.pry
    expect(cell.fired_upon?).to eq(true)
  end

  it 'has been rendered' do
    cell_1 = Cell.new("B4")

    cell_1.render(false)
    # binding.pry

    expect(cell_1.render(false)).to eq(".")

    cell_1.fire_upon
    expect(cell_1.render(false)).to eq("M")
  end

  it 'has been shown' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)

    expect(cell_2.render(false)).to eq(".")
    expect(cell_2.render(true)).to eq("S")
  end

  it 'has been hit' do
    cell_2 = Cell.new("C3")
    cruiser = Ship.new("Cruiser", 3)

    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    expect(cell_2.render(false)).to eq("H")
    expect(cell_2.render(true)).to eq("H")
  end

  it 'has it been sunk?' do
    cruiser = Ship.new("Cruiser", 3)
    cell_2 = Cell.new("C3")
    cell_2.place_ship(cruiser)
    cell_2.fire_upon

    cruiser.sunk?
    expect(cruiser.sunk?).to eq(false)

    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)
    expect(cell_2.render(false)).to eq("X")
  end
end
