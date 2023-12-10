require_relative '../../../lib/game_of_life/game'
require_relative '../../../lib/game_of_life/outputter/console'

RSpec.describe GameOfLife::Outputter::Console do
  let(:outputter) { described_class.new }
  let(:game) { GameOfLife::Game.new(5, 5, outputter) }

  describe '#output' do
    let(:expected_board) do 
      <<~BOARD
      □ □ □ □ □
      □ □ ■ □ □
      □ □ ■ □ □
      □ □ ■ □ □
      □ □ □ □ □
      BOARD
    end

    before do 
      game.set_cell(1, 2, 1)
      game.set_cell(2, 2, 1)
      game.set_cell(3, 2, 1)
    end

    it 'outputs the board correctly' do
      expect { game.output_board }.to output(expected_board).to_stdout
    end
  end
end
