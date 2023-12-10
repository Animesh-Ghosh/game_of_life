require_relative '../game_of_life/game'
require_relative '../game_of_life/outputter/console'

module GameOfLife
  class RakeTask
    def initialize
      run_task
    end

    private

    def run_task
      game = Game.new(20, 80, Outputter::Console.new)
      cell_values = [0, 1]

      # Set initial state
      20.times do |i|
        80.times do |j|
          game.set_cell(i, j, cell_values.sample)
        end
      end
      
      # Display initial state
      game.output_board
      sleep 0.5
      system 'clear'

      while true
        # Produce the next tick
        game.tick

        # Display the updated state
        game.output_board
        sleep 0.5
        system 'clear'
      end
    end
  end
end
