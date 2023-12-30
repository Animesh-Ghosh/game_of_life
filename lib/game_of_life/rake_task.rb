require_relative '../game_of_life/game'
require_relative '../game_of_life/outputter/console'
require_relative '../game_of_life/outputter/gui'

module GameOfLife
  class RakeTask
    def initialize(width: 80, height: 20, mode: :console)
      @width = width
      @height = height
      @mode = mode
      run_task
    end

    private

    def run_task
      game = Game.new(@height, @width)
      cell_values = Game::CELLS.values

      # Set initial state
      @height.times do |i|
        @width.times do |j|
          game.set_cell(i, j, cell_values.sample)
        end
      end

      outputter.new(game).render
    end

    def outputter
      if defined?(@outputter)
        @outputter
      else
        @outputter = case @mode
                     when :gui
                       Outputter::GUI
                     when :console
                       Outputter::Console
                     else
                       Outputter::Console
                     end
      end
    end
  end
end
