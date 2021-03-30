require 'rspec'
require './lib/ship'
require 'pry'

RSpec.describe Ship do
  it 'exists' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_instance_of(Ship)

    submarine = Ship.new("Submarine", 2)
    expect(submarine).to be_instance_of(Ship)
    #maybe check on convention
  end

  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.name).to eq("Cruiser")

    submarine = Ship.new("Submarine", 2)
    expect(submarine.name).to eq("Submarine")
  end

  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.length).to eq(3)

    submarine = Ship.new("Submarine", 2)
    expect(submarine.length).to eq(2)
  end

  it 'has health bar' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq(3)

    submarine = Ship.new("Submarine", 2)
    expect(submarine.health).to eq(2)
  end

  it 'has been hit' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.health).to eq(2)

    submarine = Ship.new("Submarine", 2)
    submarine.hit
    expect(submarine.health).to eq(1)
  end

  it 'has been sunk' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.sunk?).to eq(false)

    cruiser.hit
    cruiser.hit
    expect(cruiser.sunk?).to eq(true)

    submarine = Ship.new("Submarine", 2)

    submarine.hit
    expect(submarine.sunk?).to eq(false)

    submarine.hit
    expect(submarine.sunk?).to eq(true)
  end

end
