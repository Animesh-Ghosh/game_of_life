module GameOfLife
  class Game
    CELLS = {
      alive: 1,
      dead: 0
    }.freeze

    attr_accessor :board

    def initialize(rows, cols)
      @board = Array.new(rows) { Array.new(cols, CELLS[:dead]) }
    end

    def set_cell(row, col, state)
      @board[row][col] = state
    end

    def tick
      new_board = Array.new(board.length) { Array.new(board[0].length, CELLS[:dead]) }

      board.each_with_index do |row, i|
        row.each_with_index do |_cell, j|
          new_board[i][j] = next_state(i, j)
        end
      end

      @board = new_board
    end

    private

    def next_state(row, col)
      live_neighbors = count_live_neighbors(row, col)

      if @board[row][col] == CELLS[:alive]
        live_neighbors.between?(2, 3) ? CELLS[:alive] : CELLS[:dead]
      else
        live_neighbors == 3 ? CELLS[:alive] : CELLS[:dead]
      end
    end

    def count_live_neighbors(row, col)
      live_count = 0

      (-1..1).each do |i|
        (-1..1).each do |j|
          next if i == 0 && j == 0

          neighbor_row = row + i
          neighbor_col = col + j

          next unless neighbor_row.between?(0, @board.length - 1) &&
                      neighbor_col.between?(0, @board[0].length - 1) &&
                      @board[neighbor_row][neighbor_col] == 1

          live_count += 1
        end
      end

      live_count
    end
  end
end
