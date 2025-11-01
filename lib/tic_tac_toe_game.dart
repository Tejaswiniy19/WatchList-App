import 'package:flutter/material.dart';

/// A beautiful and responsive Tic Tac Toe game built with Flutter.
/// Features include score tracking, win highlighting, and smooth animations.
///
/// Created with ❤️ by Flutter Developer
class TicTacToeGame extends StatefulWidget {
  const TicTacToeGame({super.key});

  @override
  State<TicTacToeGame> createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  // Game state variables
  List<String> board = List.filled(9, ''); // Represents the 3x3 game board
  bool isXTurn = true; // Tracks whose turn it is (X starts first)
  int xScore = 0; // X player's score
  int oScore = 0; // O player's score
  int draws = 0; // Number of draw games
  bool gameOver = false; // Whether the current game has ended
  String result = ''; // Result message (X WINS!, O WINS!, DRAW!)
  List<int> winningLine = []; // Indices of winning cells for highlighting

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414), // Dark theme background
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF141414),
        elevation: 0, // Remove shadow
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Score display at the top
            _buildScoreBoard(),
            const SizedBox(height: 10),

            // Main game board - responsive and square
            Expanded(child: _buildGameBoard()),
            const SizedBox(height: 10),

            // Game result display (only shown when game is over)
            if (gameOver) _buildGameResult(),

            // Restart game button
            _buildRestartButton(),
          ],
        ),
      ),
    );
  }

  /// Builds the score board showing X wins, draws, and O wins
  Widget _buildScoreBoard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildScoreCard('X', xScore, Colors.blue),
        _buildScoreCard('Draws', draws, Colors.grey),
        _buildScoreCard('O', oScore, Colors.red),
      ],
    );
  }

  /// Creates an individual score card widget
  Widget _buildScoreCard(String title, int score, Color color) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 2),
        // Score container with colored border
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Text(
              '$score',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Builds the main 3x3 game board grid
  Widget _buildGameBoard() {
    return AspectRatio(
      aspectRatio: 1, // Ensures the board remains square
      child: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 columns for 3x3 grid
          crossAxisSpacing: 6, // Spacing between columns
          mainAxisSpacing: 6, // Spacing between rows
        ),
        itemCount: 9, // 9 cells total
        itemBuilder: (context, index) {
          return _buildCell(index);
        },
      ),
    );
  }

  /// Builds an individual cell in the game board
  Widget _buildCell(int index) {
    // Check if this cell is part of the winning line
    bool isWinningCell = winningLine.contains(index);

    return GestureDetector(
      onTap: () => _makeMove(index),
      child: Container(
        decoration: BoxDecoration(
          // Highlight winning cells with a semi-transparent color
          color: isWinningCell
              ? (board[index] == 'X'
                  ? Colors.blue.withOpacity(0.3)
                  : Colors.red.withOpacity(0.3))
              : Colors.grey[800], // Default cell color
          borderRadius: BorderRadius.circular(6),
          // Add colored border to winning cells
          border: isWinningCell
              ? Border.all(
                  color: board[index] == 'X' ? Colors.blue : Colors.red,
                  width: 2,
                )
              : null,
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200), // Smooth animation
            child: Text(
              board[index],
              key: ValueKey<String>(
                  '${board[index]}$index'), // Unique key for animation
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: board[index] == 'X' ? Colors.blue : Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Displays the game result when the game is over
  Widget _buildGameResult() {
    return Column(
      children: [
        const Text(
          'Game Over',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          result,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: result == 'X WINS!'
                ? Colors.blue
                : result == 'O WINS!'
                    ? Colors.red
                    : Colors.grey, // Draw color
          ),
        ),
      ],
    );
  }

  /// Builds the restart game button
  Widget _buildRestartButton() {
    return ElevatedButton(
      onPressed: _restartGame,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE50914), // Netflix red color
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: const Text(
        'Restart Game',
        style: TextStyle(fontSize: 16, color: Colors.white), // Fixed font size
      ),
    );
  }

  /// Handles player moves when a cell is tapped
  void _makeMove(int index) {
    // Only allow moves on empty cells when game is active
    if (board[index].isEmpty && !gameOver) {
      setState(() {
        // Place X or O based on current turn
        board[index] = isXTurn ? 'X' : 'O';

        // Check if current move resulted in a win
        if (_checkWinner(isXTurn ? 'X' : 'O')) {
          gameOver = true;
          if (isXTurn) {
            xScore++;
            result = 'X WINS!';
          } else {
            oScore++;
            result = 'O WINS!';
          }
        } else if (_isBoardFull()) {
          // Check for draw
          gameOver = true;
          draws++;
          result = 'DRAW!';
        } else {
          // Continue game, switch turns
          isXTurn = !isXTurn;
        }
      });
    }
  }

  /// Checks if the specified player has won the game
  bool _checkWinner(String player) {
    // All possible winning combinations (rows, columns, diagonals)
    final winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6], // Diagonals
    ];

    // Check each winning combination
    for (var combo in winningCombinations) {
      if (board[combo[0]] == player &&
          board[combo[1]] == player &&
          board[combo[2]] == player) {
        winningLine = combo; // Store winning line for highlighting
        return true;
      }
    }
    return false;
  }

  /// Checks if the board is completely filled (draw condition)
  bool _isBoardFull() => board.every((cell) => cell.isNotEmpty);

  /// Resets the game board for a new game while preserving scores
  void _restartGame() {
    setState(() {
      board = List.filled(9, ''); // Clear board
      isXTurn = true; // X starts first
      gameOver = false; // Reset game state
      result = ''; // Clear result message
      winningLine = []; // Reset winning line highlights
    });
  }
}
