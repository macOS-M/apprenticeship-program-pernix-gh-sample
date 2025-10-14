require_relative 'player'

class AdvancedPcPlayer < Player
  DIFFICULTY_LEVELS = {
    easy: 0.3,
    medium: 0.7,
    hard: 0.95,
    impossible: 1.0
  }

  def initialize(name = "PC", symbol = "O", difficulty = :impossible)
    super(name, symbol)
    @opponent_symbol = symbol == "X" ? "O" : "X"
    @difficulty = difficulty
    @optimal_play_rate = DIFFICULTY_LEVELS[difficulty] || 1.0
  end

  def make_move(board)
    available_moves = get_available_moves(board)
    return nil if available_moves.empty?
    
    move = if rand < @optimal_play_rate
             optimal_move(board)
           else
             suboptimal_move(board)
           end
    
    if move && board.empty_cell?(move[0], move[1])
      move
    else
      available_moves.first
    end
  end

  private

  def optimal_move(board)
    if first_move?(board)
      move = first_move_strategy(board)
      return move if move && board.empty_cell?(move[0], move[1])
    end

    best_move = minimax_alpha_beta_best_move(board)
    best_move
  end

  def first_move?(board)
    empty_cells = board.grid.flatten.count(" ")
    empty_cells == 9 || empty_cells == 8
  end

  def first_move_strategy(board)
    center = [1, 1]
    corners = [[0, 0], [0, 2], [2, 0], [2, 2]]
    
    if board.empty_cell?(center[0], center[1]) && rand < 0.6
      return center
    end
    
    available_corners = corners.select { |row, col| board.empty_cell?(row, col) }
    return available_corners.sample unless available_corners.empty?
    
    get_available_moves(board).first
  end

  def minimax_alpha_beta_best_move(board)
    best_score = -Float::INFINITY
    best_move = nil
    alpha = -Float::INFINITY
    beta = Float::INFINITY

    get_available_moves(board).each do |row, col|
      next unless board.empty_cell?(row, col)
      
      board.place_symbol(row, col, @symbol)
      
      score = minimax_alpha_beta(board, 0, false, alpha, beta)
      
      board.grid[row][col] = " "
      
      if score > best_score
        best_score = score
        best_move = [row, col]
      end
      
      alpha = [alpha, score].max
    end

    best_move
  end

  def minimax_alpha_beta(board, depth, is_maximizing, alpha, beta)
    result = evaluate_board_advanced(board, depth)
    return result if result != nil

    if is_maximizing
      max_score = -Float::INFINITY
      
      get_available_moves(board).each do |row, col|
        board.place_symbol(row, col, @symbol)
        score = minimax_alpha_beta(board, depth + 1, false, alpha, beta)
        board.grid[row][col] = " "
        
        max_score = [score, max_score].max
        alpha = [alpha, score].max
        break if beta <= alpha  # Poda alfa-beta
      end
      
      return max_score
    else
      min_score = Float::INFINITY
      
      get_available_moves(board).each do |row, col|
        board.place_symbol(row, col, @opponent_symbol)
        score = minimax_alpha_beta(board, depth + 1, true, alpha, beta)
        board.grid[row][col] = " "
        
        min_score = [score, min_score].min
        beta = [beta, score].min
        break if beta <= alpha
      end
      
      return min_score
    end
  end

  def evaluate_board_advanced(board, depth)
    winner = board.winner?
    
    if winner == @symbol
      return 10 - depth
    elsif winner == @opponent_symbol
      return depth - 10
    elsif board_full?(board)
      return 0
    else
      return nil
    end
  end

  def get_available_moves(board)
    moves = []
    (0..2).each do |row|
      (0..2).each do |col|
        moves << [row, col] if board.empty_cell?(row, col)
      end
    end
    
    prioritize_moves(moves, board)
  end

  def prioritize_moves(moves, board)
    center = [1, 1]
    corners = [[0, 0], [0, 2], [2, 0], [2, 2]]
    edges = [[0, 1], [1, 0], [1, 2], [2, 1]]
    
    prioritized = []
    
    prioritized << center if moves.include?(center)
    
    corners.each { |corner| prioritized << corner if moves.include?(corner) }
    
    edges.each { |edge| prioritized << edge if moves.include?(edge) }
    
    prioritized
  end

  def suboptimal_move(board)
    available_moves = get_available_moves(board)
    return available_moves.first if available_moves.length == 1
    
    safe_moves = available_moves.reject do |row, col|
      next unless board.empty_cell?(row, col)
      
      board.place_symbol(row, col, @symbol)
      opponent_can_win = can_opponent_win_next_turn?(board)
      board.grid[row][col] = " "
      opponent_can_win
    end
    
    moves_to_choose = safe_moves.empty? ? available_moves : safe_moves
    moves_to_choose.sample
  end

  def can_opponent_win_next_turn?(board)
    (0..2).each do |row|
      (0..2).each do |col|
        if board.empty_cell?(row, col)
          board.place_symbol(row, col, @opponent_symbol)
          if board.winner? == @opponent_symbol
            board.grid[row][col] = " "
            return true
          end
          board.grid[row][col] = " "
        end
      end
    end
    false
  end

  def board_full?(board)
    board.grid.flatten.none? { |cell| cell == " " }
  end
end
