require 'rspec'
require './lib/ship'
require 'pry'

RSpec.describe Ship do
  it 'exits' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser).to be_instance_of(Ship)
  end

  it 'has a name' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.name).to eq("Cruiser")
  end

  it 'has a length' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.length).to eq(3)
  end

  it 'has health bar' do
    cruiser = Ship.new("Cruiser", 3)
    expect(cruiser.health).to eq(3)
  end

  it 'has been hit' do
    cruiser = Ship.new("Cruiser", 3)
    cruiser.hit
    expect(cruiser.health).to eq(2)
  end

  # it 'has been hit' do
  #   submarine = Ship.new("Submarine", 2)
  #   submarine.hit
  #   expect(submarine.health).to eq(1)
  # end


end
