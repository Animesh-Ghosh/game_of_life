require 'optparse'
require_relative '../game_of_life/game'
require_relative '../game_of_life/outputter/console'
require_relative '../game_of_life/outputter/gui'

module GameOfLife
  class RakeTask
    DEFAULT_OPTIONS = {
      width: 80,
      height: 20,
      mode: :console
    }.freeze

    def initialize
      parse_options
      run_task
    end

    private

    def parse_options
      options = {
        width: DEFAULT_OPTIONS[:width],
        height: DEFAULT_OPTIONS[:height],
        mode: DEFAULT_OPTIONS[:mode]
      }
      parser = OptionParser.new
      parser.on('-w [WIDTH]', '--width [WIDTH]', Integer, 'Width of the game board')
      parser.on('-h [HEIGHT]', '--height [HEIGHT]', Integer, 'Height of the game board')
      parser.on('-m [MODE]', '--mode [MODE]', %w[console gui],
                'Rendering mode, console by default', 'console, gui') do |mode|
        options[:mode] = mode.to_sym
      end
      parser.on('-h', '--help', 'Help') do
        puts parser
        exit 0
      end
      args = parser.order!(ARGV) {}
      parser.parse!(args, into: options)
      @width = options[:width]
      @height = options[:height]
      @mode = options[:mode]
    end

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
