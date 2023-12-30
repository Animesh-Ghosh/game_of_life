require_relative '../../lib/game_of_life/game'

RSpec.describe GameOfLife::Game do
  let(:game) { described_class.new(5, 5) }

  before do
    game.set_cell(1, 2, 1)
    game.set_cell(2, 2, 1)
    game.set_cell(3, 2, 1)
  end

  describe '#set_cell' do
    let(:expected_board) do
      [
        [0, 0, 0, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0]
      ]
    end

    it 'sets cells correctly' do
      expect(game.board).to eq(expected_board)
    end
  end

  describe '#tick' do
    before { game.tick }

    let(:expected_board) do
      [
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [0, 1, 1, 1, 0],
        [0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0]
      ]
    end

    it 'changes state of the board' do
      expect(game.board).to eq(expected_board)
    end
  end
end
