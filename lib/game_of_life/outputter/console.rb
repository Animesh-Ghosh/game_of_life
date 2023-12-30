module GameOfLife
  module Outputter
    class Console
      def initialize(game)
        @game = game
      end

      def render
        # Display initial state
        output
        sleep 0.5
        system 'clear'

        loop do
          # Produce the next tick
          @game.tick

          # Display the updated state
          output
          sleep 0.5
          system 'clear'
        end
      end

      private

      def output
        @game.board.each do |row|
          puts row.map { |cell| cell == Game::CELLS[:alive] ? '■' : '□' }.join(' ')
        end
      end
    end
  end
end
