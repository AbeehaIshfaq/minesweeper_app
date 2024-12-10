class Board < ApplicationRecord
    serialize :grid, Array, coder: JSON
    def generate_board
      # Initialize the grid with empty cells
      board = Array.new(height) { Array.new(width, 0) }
  
      # Place mines randomly
      mines.times do
        loop do
          row = rand(0...height)
          col = rand(0...width)
          if board[row][col] != 'M'
            board[row][col] = 'M'
            break
          end
        end
      end
  
      # Calculate adjacent mine counts
      directions = [-1, 0, 1].repeated_permutation(2).to_a - [[0, 0]]
      height.times do |row|
        width.times do |col|
          next if board[row][col] == 'M'
  
          count = directions.count do |dx, dy|
            nr, nc = row + dx, col + dy
            nr.between?(0, height - 1) && nc.between?(0, width - 1) && board[nr][nc] == 'M'
          end
          board[row][col] = count
        end
      end
  
      self.grid = board
    end
end
  