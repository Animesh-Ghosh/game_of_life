require_relative '../lib/game_of_life'

RSpec.describe GameOfLife do
  let(:game) { described_class.new(5, 5) }

  before do 
    game.set_cell(1, 2, 1)
    game.set_cell(2, 2, 1)
    game.set_cell(3, 2, 1)
  end

  describe '#set_cell' do
    it 'sets cells correctly' do
      expect(game.board).to eq([
        [0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0]
      ])
    end
  end

  describe '#tick' do
    before { game.tick }

    it 'changes state of the board' do
      expect(game.board).to eq([
        [0, 0, 0, 0, 0], 
        [0, 0, 0, 0, 0], 
        [0, 1, 1, 1, 0], 
        [0, 0, 0, 0, 0], 
        [0, 0, 0, 0, 0]
      ])
    end
  end
end
