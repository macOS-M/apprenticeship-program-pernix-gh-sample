Historia 1: Inicio del juego
Escenario 1: Tablero inicial vacío
Given: Un jugador inicia una nueva partida.
When: Se muestra la cuadricula.
Then: Todas las casillas deben estar vacías.

Escenario 2: Elección del jugador
Given: Un jugador inicia el juego.
When: Selecciona su marca.
Then: Se registra correctamente.

Escenario 3: Mostrar turno inicial
Given: Un jugador inica la partida.
When: Se inicia el juego.
Then: Se muestra el turno del jugador correcto.

Historia 2: Realizar un movimiento:
Escenario 1: Colocar marca en un punto vacío
Given: Es el turno del jugador.
When: Coloca una marca en un punto disponible.
Then: El punto muestra la marca del jugador.

Escenario 2: Colocar marca en un punto ocupado
Given: Es el turno del jugador.
When: Coloca una marca en un punto ocupado.
Then: Muestra un error relacionado o simplemente no permite el movimiento.

Escenario 3: Cambio de turno
Given: El jugador hace un movimiento válido.
When: Se actualiza el turno.
Then: Se pasa el turno al siguiente jugador.

Historia 3: Determinación de ganador
Escenario 1: Ganador por fila
Given: Hay 3 marcas del mismo tipo horizontal.
When: Se realiza el ultimo movimiento.
Then: Se decide el ganador.

Escenario 2: Ganador por columna
Given: Hay 3 marcas del mismo tipo vertical
When: Se realiza el ultimo movimiento.
Then: Se decide el ganador.

Escenario 3: Ganador por fila diagonal
Given: Hay 3 marcas del mismo tipo diagonal.
When: Se realiza el ultimo movimiento.
Then: Se decide el ganador.

Escenario 4: Empate
Given: No hay 3 marcas consecutivas de ningún tipo.
When: No hay puntos disponibles.
Then: Se declara empate.

Historia 4: Reiniciar el juego
Escenario 1: Reiniciar tablero
Given: La partida está en curso.
When: Se activa el botón de reiniciar.
Then: Se restablece la cuadrícula.

Historia 5: Interfaz de usuario intuitiva
Escenario 1: Cuadricula visible y clara
Given: El juego está en curso.
When: Se observa la pantalla.
Then: La cuadricula es facil de entender.

Escenario 2: Indicadores de turno
Given: El juego está en curso.
When: Se observa la pantalla.
Then: Se entiende facilmente de quien es el turno.

Escenario 3: Casillas seleccionables
Given: El juego está en curso.
When: Se observa la pantalla.
Then: El jugador puede ver la delimitación correcta de la cuadrícula y puede notar cuales son seleccionables.

Historia 6: Modo multijugador Local
Escenario 1: Turnos alternantes
Given: Hay 2 jugadores en el mismo dispositivo.
When: Un jugador termina su turno.
Then: El siguiente jugador comienza su turno.

Escenario 2: Marcador del juego visible para ambos
Given: Hay 2 jugadores en el mismo dispositivo.
When: Se observa el tablero.
Then: El marcador refleja la situación actual del juego.

Historia 7: Modo jugador vs IA
Escenario 1: Selección de dificultad
Given: El jugador elige la dificultad.
When: Se inicia el juego.
Then: La IA juega según la dificultad seleccionada correctamente.

Escenario 2: Movimientos de la IA
Given: Es el turno de la IA.
When: La IA completa su movimiento.
Then: La casilla elgida es válida.