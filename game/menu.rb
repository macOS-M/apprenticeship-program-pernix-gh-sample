# frozen_string_literal: true

class Menu
  def display_main_menu
    puts "\n" + "="*50
    puts "         BIENVENIDO AL TIC-TAC-TOE"
    puts "="*50
    puts "1. Jugar contra la PC"
    puts "2. Jugar contra jugador local"
    puts "3. Ver historial de partidas"
    puts "4. Salir del juego"
    puts "="*50
    print "Selecciona una opción (1-4): "
  end
  def get_user_choice
    gets.chomp.to_i
  end

  def show_invalid_option_message
    puts "Opción inválida. Por favor, selecciona un número del 1 al 4."
  end

  def show_goodbye_message
    puts "¡Gracias por jugar! ¡Hasta luego!"
  end

  def pause_for_user
    puts "\nPresiona Enter para continuar..."
    gets
  end

  def get_player_name(player_number)
    print "Ingresa el nombre del Jugador #{player_number}: "
    name = gets.chomp
    name.empty? ? "Jugador #{player_number}" : name
  end

  def show_game_mode_message(mode)
    case mode
    when :vs_pc
      puts "\n¡Has elegido jugar contra la PC!"
    when :local
      puts "\n¡Has elegido jugar contra otro jugador!"
    end
  end

  def show_game_history(history)
    puts "\n" + "="*60
    puts "             HISTORIAL DE PARTIDAS"
    puts "="*60
    
    if history.empty?
      puts "No hay partidas registradas aún."
      puts "¡Juega algunas partidas para ver tu historial aquí!"
    else
      history.each_with_index do |game, index|
        mode_text = game[:mode] == :vs_pc ? "vs PC" : "Local"
        puts "\n#{index + 1}. #{game[:date]} [#{mode_text}]"
        puts "   #{game[:player1]} vs #{game[:player2]}"
        puts "   Ganador: #{game[:winner]}"
        puts "-" * 40
      end
      
      puts "\nTotal de partidas jugadas: #{history.length}"
      wins_count = history.count { |game| game[:winner] != "Empate" }
      draws_count = history.count { |game| game[:winner] == "Empate" }
      puts "Victorias: #{wins_count} | Empates: #{draws_count}"
    end
    puts "="*60
  end
end
