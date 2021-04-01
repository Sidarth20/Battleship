require './lib/board'

RSpec.describe 'Board' do
  it 'exists' do
    board = Board.new

    expect(board).to be_instance_of(Board)
  end

  it 'has cells' do
    board = Board.new

    expect(board.cells).to eq({ "A1" => cell,
                                "A2" => cell,
                                "A3" => cell,
                                "A4" => cell,
                                "A5" => cell,
                                "A6" => cell,
                                "A7" => cell,
                                "A8" => cell,
                                "A9" => cell,
                                "A10" => cell,
                                "A11" => cell,
                                "A12" => cell,
                                "A13" => cell,
                                "A14" => cell,
                                "A15" => cell,
                                "A16" => cell})
  end
end
