require_relative 'board'
require_relative 'player'
require_relative 'pc_player'
require_relative 'advanced_pc_player'
require_relative 'menu'

class Game
  def initialize
    @menu = Menu.new
    @game_history = []
  end

  def start
    loop do
      @menu.display_main_menu
      choice = @menu.get_user_choice
      
      case choice
      when 1
        play_against_pc
      when 2
        play_against_local_player
      when 3
        @menu.show_game_history(@game_history)
      when 4
        @menu.show_goodbye_message
        break
      else
        @menu.show_invalid_option_message
      end
      
      @menu.pause_for_user
    end
  end

  private

  def play_against_pc
    @menu.show_game_mode_message(:vs_pc)
    
    print "Ingresa tu nombre: "
    player_name = gets.chomp
    player_name = "Jugador" if player_name.empty?
    
    puts "\nSelecciona la dificultad:"
    puts "1. Fácil"
    puts "2. Medio"
    puts "3. Difícil"
    puts "4. Muy difícil"
    print "Selecciona dificultad (1-4): "
    
    difficulty_choice = gets.chomp.to_i
    difficulty = case difficulty_choice
                when 1 then :easy
                when 2 then :medium
                when 3 then :hard
                else :impossible
                end
    
    puts "Elige tu símbolo:"
    puts "1. X (juegas primero)"
    puts "2. O (PC juega primero)"
    print "Selecciona (1-2): "
    
    symbol_choice = gets.chomp.to_i
    if symbol_choice == 1
      human_player = Player.new(player_name, "X")
      pc_player = AdvancedPcPlayer.new("PC", "O", difficulty)
      play_game_loop_vs_pc(human_player, pc_player, :vs_pc)
    elsif symbol_choice == 2
      human_player = Player.new(player_name, "O")
      pc_player = AdvancedPcPlayer.new("PC", "X", difficulty)
      play_game_loop_vs_pc(pc_player, human_player, :vs_pc)
    else
      puts "Opción inválida. Usando X por defecto."
      human_player = Player.new(player_name, "X")
      pc_player = AdvancedPcPlayer.new("PC", "O", difficulty)
      play_game_loop_vs_pc(human_player, pc_player, :vs_pc)
    end
  end

  def play_against_local_player
    @menu.show_game_mode_message(:local)
    
    player1_name = @menu.get_player_name(1)
    player2_name = @menu.get_player_name(2)
    
    play_game_loop(Player.new(player1_name, "X"), Player.new(player2_name, "O"), :local)
  end

  def play_game_loop_vs_pc(first_player, second_player, game_mode)
    board = Board.new
    current_player = first_player
    winner = nil

    loop do
      board.display
      
      if current_player.is_a?(PcPlayer) || current_player.is_a?(AdvancedPcPlayer)
        puts "\n#{current_player.name} está pensando..."
        sleep(1)
        
        move = current_player.make_move(board)
        
        if move && board.empty_cell?(move[0], move[1])
          row, col = move
          puts "#{current_player.name} eligió la posición #{row * 3 + col + 1}"
        else
          puts "Error: La PC no pudo hacer un movimiento válido."
          break
        end
      else
        puts "\n#{current_player.name}, elige un número (1-9) para colocar tu símbolo:"
        input = gets.chomp.to_i

        if input >= 1 && input <= 9
          row, col = Board.number_to_coordinates(input)
          
          unless board.empty_cell?(row, col)
            puts "¡Esa casilla ya está ocupada! Intenta de nuevo."
            next
          end
        else
          puts "¡Entrada inválida! Ingresa un número entre 1 y 9."
          next
        end
      end

      board.place_symbol(row, col, current_player.symbol)

      if board.winner?
        board.display
        puts "\n¡#{current_player.name} gana!"
        winner = current_player.name
        break
      end

      if board.grid.flatten.none? { |cell| cell == " " }
        board.display
        puts "\n¡Es un empate!"
        winner = "Empate"
        break
      end

      current_player = current_player == first_player ? second_player : first_player
    end

    save_game_to_history(first_player.name, second_player.name, winner, game_mode)
  end

  def play_game_loop(player1, player2, game_mode)
    board = Board.new
    current_player = player1
    winner = nil

    loop do
      board.display
      puts "\n#{current_player.name}, elige un número (1-9) para colocar tu símbolo:"

      input = gets.chomp.to_i

      if input >= 1 && input <= 9
        row, col = Board.number_to_coordinates(input)

        if board.empty_cell?(row, col)
          board.place_symbol(row, col, current_player.symbol)

          if board.winner?
            board.display
            puts "\n¡#{current_player.name} gana!"
            winner = current_player.name
            break
          end

          if board.grid.flatten.none? { |cell| cell == " " }
            board.display
            puts "\n¡Es un empate!"
            winner = "Empate"
            break
          end

          current_player = current_player == player1 ? player2 : player1
        else
          puts "¡Esa casilla ya está ocupada! Intenta de nuevo."
        end
      else
        puts "¡Entrada inválida! Ingresa un número entre 1 y 9."
      end
    end

    save_game_to_history(player1.name, player2.name, winner, game_mode)
  end

  def save_game_to_history(player1, player2, winner, game_mode)
    game_record = {
      date: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
      player1: player1,
      player2: player2,
      winner: winner,
      mode: game_mode
    }
    @game_history << game_record
  end
end
