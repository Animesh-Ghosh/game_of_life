require 'ruby2d/core'

module GameOfLife
  module Outputter
    class GUI
      include Ruby2D
      include Ruby2D::DSL

      def initialize(game)
        @game = game
        width = game.board.first.size
        height = game.board.size
        set title: 'Game of Life'
        size = get(:width) / width
        @squares = Array.new(height) do |i|
          Array.new(width) do |j|
            Square.new(x: j * size, y: i * size, size:, color: 'white')
          end
        end
      end

      def render
        # Display initial state
        output
        sleep 0.5

        # Produce the next tick
        update do
          @game.tick
          # Display the updated state
          output
          sleep 0.5
        end

        show
      end

      private

      def output
        @game.board.zip(@squares).each do |row, squares_row|
          row.zip(squares_row) do |cell, square|
            square.color = if cell == Game::CELLS[:alive]
                             'black'
                           else
                             'white'
                           end
          end
        end
      end
    end
  end
end
