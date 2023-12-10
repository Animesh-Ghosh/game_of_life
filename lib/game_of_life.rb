class GameOfLife
  
  attr_accessor :board

  def initialize(rows, cols)
    @board = Array.new(rows) { Array.new(cols, 0) }
  end

  def set_cell(row, col, state)
    @board[row][col] = state
  end

  def tick
    new_board = Array.new(board.length) { Array.new(board[0].length, 0) }

    board.each_with_index do |row, i|
      row.each_with_index do |cell, j|
        new_board[i][j] = next_state(i, j)
      end
    end

    @board = new_board
  end

  private

  def next_state(row, col)
    live_neighbors = count_live_neighbors(row, col)

    if @board[row][col] == 1
      return live_neighbors.between?(2, 3) ? 1 : 0
    else
      return live_neighbors == 3 ? 1 : 0
    end
  end

  def count_live_neighbors(row, col)
    live_count = 0

    (-1..1).each do |i|
      (-1..1).each do |j|
        next if i == 0 && j == 0
        neighbor_row, neighbor_col = row + i, col + j

        if neighbor_row.between?(0, @board.length - 1) &&
          neighbor_col.between?(0, @board[0].length - 1) &&
          @board[neighbor_row][neighbor_col] == 1
          live_count += 1
        end
      end
    end

    live_count
  end
end
