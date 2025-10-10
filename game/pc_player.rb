# frozen_string_literal: true
require_relative 'player'
class PcPlayer < Player
  def initialize(name = "PC", symbol = "O")
    super(name, symbol)
    @opponent_symbol = symbol == "X" ? "O" : "X"
  end

  def make_move(board)
    # Usar algoritmo Minimax para encontrar el mejor movimiento
    best_move = minimax_best_move(board)
    best_move
  end

  private

  def minimax_best_move(board)
    best_score = -Float::INFINITY
    best_move = nil

    # Evaluar todos los movimientos posibles
    (0..2).each do |row|
      (0..2).each do |col|
        if board.empty_cell?(row, col)
          # Hacer movimiento temporal
          board.place_symbol(row, col, @symbol)

          # Calcular score usando minimax
          score = minimax(board, 0, false)

          # Deshacer movimiento
          board.grid[row][col] = " "

          # Actualizar mejor movimiento si es necesario
          if score > best_score
            best_score = score
            best_move = [row, col]
          end
        end
      end
    end

    best_move
  end

  def minimax(board, depth, is_maximizing)
    result = evaluate_board(board)
    return result if result != nil

    if is_maximizing
      best_score = -Float::INFINITY

      (0..2).each do |row|
        (0..2).each do |col|
          if board.empty_cell?(row, col)
            board.place_symbol(row, col, @symbol)
            score = minimax(board, depth + 1, false)
            board.grid[row][col] = " "
            best_score = [score, best_score].max
          end
        end
      end

      return best_score
    else
      best_score = Float::INFINITY

      (0..2).each do |row|
        (0..2).each do |col|
          if board.empty_cell?(row, col)
            board.place_symbol(row, col, @opponent_symbol)
            score = minimax(board, depth + 1, true)
            board.grid[row][col] = " "
            best_score = [score, best_score].min
          end
        end
      end

      return best_score
    end
  end

  def evaluate_board(board)
    winner = board.winner?

    if winner == @symbol
      return 10
    elsif winner == @opponent_symbol
      return -10
    elsif board_full?(board)
      return 0
    else
      return nil
    end
  end

  def board_full?(board)
    board.grid.flatten.none? { |cell| cell == " " }
  end
end
