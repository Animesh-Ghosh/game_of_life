module GameOfLife
  module Outputter
    class Console
      def output(board)
        board.each do |row|
          puts row.map { |cell| cell == 1 ? '■' : '□' }.join(' ')
        end
      end
    end
  end
end
