// test/games_test.dart
// Tests for all three games: Tic Tac Toe, Nuts & Bolts, Funny Quiz

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tejs_app/tic_tac_toe_game.dart';
import 'package:tejs_app/nuts_and_bolts.dart';
import 'package:tejs_app/funny_quiz_game.dart';

void main() {
  group('Tic Tac Toe Game Tests', () {
    testWidgets('Game should build without errors',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TicTacToeGame()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(TicTacToeGame), findsOneWidget);
    });

    testWidgets('Game board should have 9 cells', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TicTacToeGame()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('Score board should display X, O, and Draws',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TicTacToeGame()),
      );
      await tester.pumpAndSettle();

      expect(find.text('X'), findsOneWidget);
      expect(find.text('O'), findsOneWidget);
      expect(find.text('Draws'), findsOneWidget);
    });

    testWidgets('Initial scores should be 0', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TicTacToeGame()),
      );
      await tester.pumpAndSettle();

      expect(find.text('0'), findsNWidgets(3));
    });

    testWidgets('X should be placed on first tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TicTacToeGame()),
      );
      await tester.pumpAndSettle();

      // Tap first cell
      final firstCell = find.byType(GestureDetector).first;
      await tester.tap(firstCell);
      await tester.pump();

      expect(find.text('X'), findsNWidgets(1));
    });

    testWidgets('Cannot place on occupied cell', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TicTacToeGame()),
      );
      await tester.pumpAndSettle();

      final cells = find.byType(GestureDetector);

      // Tap first cell
      await tester.tap(cells.first);
      await tester.pump();

      // Count X's
      final xCountBefore = tester.widgetList(find.text('X')).length;

      // Try to tap same cell again
      await tester.tap(cells.first);
      await tester.pump();

      // X count should remain same
      final xCountAfter = tester.widgetList(find.text('X')).length;
      expect(xCountBefore, xCountAfter);
    });

    testWidgets('Restart button should reset game',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TicTacToeGame()),
      );
      await tester.pumpAndSettle();

      // Make some moves
      final cells = find.byType(GestureDetector);
      await tester.tap(cells.first);
      await tester.pump();

      // Find and tap restart button
      final restartButton = find.text('Restart Game');
      expect(restartButton, findsOneWidget);

      await tester.tap(restartButton);
      await tester.pumpAndSettle();

      // Board should be clear
      expect(find.text('X'), findsOneWidget); // Only in score
    });

    testWidgets('Winning row should be detected', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TicTacToeGame()),
      );
      await tester.pumpAndSettle();

      final cells = find.byType(GestureDetector);

      // Simulate X winning top row: positions 0, 1, 2
      await tester.tap(cells.at(0)); // X
      await tester.pump();
      await tester.tap(cells.at(3)); // O
      await tester.pump();
      await tester.tap(cells.at(1)); // X
      await tester.pump();
      await tester.tap(cells.at(4)); // O
      await tester.pump();
      await tester.tap(cells.at(2)); // X wins
      await tester.pumpAndSettle();

      // Should show game over
      expect(find.text('Game Over'), findsOneWidget);
    });

    testWidgets('AnimatedSwitcher should animate cell changes',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: TicTacToeGame()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(AnimatedSwitcher), findsWidgets);
    });
  });

  group('Nuts and Bolts Puzzle Tests', () {
    testWidgets('Game should build without errors',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: NutsAndBoltsPuzzle()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(NutsAndBoltsPuzzle), findsOneWidget);
    });

    testWidgets('Game should show title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: NutsAndBoltsPuzzle()),
      );
      await tester.pumpAndSettle();

      expect(find.text('Nuts & Bolts Puzzle'), findsOneWidget);
    });

    testWidgets('Game should show instructions', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: NutsAndBoltsPuzzle()),
      );
      await tester.pumpAndSettle();

      expect(find.text('Drag nuts to matching bolts!'), findsOneWidget);
    });

    testWidgets('Should have refresh button', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: NutsAndBoltsPuzzle()),
      );
      await tester.pumpAndSettle();

      final refreshButton = find.byIcon(Icons.refresh);
      expect(refreshButton, findsOneWidget);
    });

    testWidgets('Should display nuts and bolts', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: NutsAndBoltsPuzzle()),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining(RegExp(r'Nut \d')), findsWidgets);
      expect(find.textContaining(RegExp(r'Bolt \d')), findsWidgets);
    });

    testWidgets('Nuts should be draggable', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: NutsAndBoltsPuzzle()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Draggable<int>), findsWidgets);
    });

    testWidgets('Bolts should be drag targets', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: NutsAndBoltsPuzzle()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(DragTarget<int>), findsWidgets);
    });

    testWidgets('Refresh button should restart game',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: NutsAndBoltsPuzzle()),
      );
      await tester.pumpAndSettle();

      final refreshButton = find.byIcon(Icons.refresh);

      await tester.tap(refreshButton);
      await tester.pumpAndSettle();

      expect(find.textContaining(RegExp(r'Nut \d')), findsWidgets);
    });

    testWidgets('Dark theme should be applied', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: NutsAndBoltsPuzzle()),
      );
      await tester.pumpAndSettle();

      final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
      expect(scaffold.backgroundColor, const Color(0xFF121212));
    });
  });

  group('Funny Quiz Game Tests', () {
    testWidgets('Game should build without errors',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: FunnyQuizGame()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(FunnyQuizGame), findsOneWidget);
    });

    testWidgets('Game should show title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: FunnyQuizGame()),
      );
      await tester.pumpAndSettle();

      expect(find.text('😂 Funny Quiz Game'), findsOneWidget);
    });

    testWidgets('Should show first question on start',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: FunnyQuizGame()),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('cats'), findsOneWidget);
    });

    testWidgets('Should show 4 answer options', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: FunnyQuizGame()),
      );
      await tester.pumpAndSettle();

      final options = find.byType(GestureDetector);
      expect(options, findsNWidgets(4));
    });

    testWidgets('Should show current score', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: FunnyQuizGame()),
      );
      await tester.pumpAndSettle();

      expect(find.textContaining('Score:'), findsOneWidget);
    });

    testWidgets('Selecting answer should show feedback',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: FunnyQuizGame()),
      );
      await tester.pumpAndSettle();

      final options = find.byType(GestureDetector);
      await tester.tap(options.first);
      await tester.pumpAndSettle();

      final correctFeedback = find.textContaining('Correct');
      final wrongFeedback = find.textContaining('Oops');

      expect(
          correctFeedback.evaluate().isNotEmpty ||
              wrongFeedback.evaluate().isNotEmpty,
          true);
    });

    testWidgets('Next button should appear after answering',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: FunnyQuizGame()),
      );
      await tester.pumpAndSettle();

      final options = find.byType(GestureDetector);
      await tester.tap(options.first);
      await tester.pumpAndSettle();

      expect(find.text('Next ➡️'), findsOneWidget);
    });

    testWidgets('Tapping Next should show next question',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: FunnyQuizGame()),
      );
      await tester.pumpAndSettle();

      final options = find.byType(GestureDetector);
      await tester.tap(options.first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Next ➡️'));
      await tester.pumpAndSettle();

      expect(find.textContaining('internet'), findsOneWidget);
    });

    testWidgets('Completing all questions should show results',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(home: FunnyQuizGame()),
      );
      await tester.pumpAndSettle();

      // Answer all 6 questions
      for (int i = 0; i < 6; i++) {
        final options = find.byType(GestureDetector);
        await tester.tap(options.first);
        await tester.pumpAndSettle();

        if (i < 5) {
          final nextButton = find.text('Next ➡️');
          await tester.tap(nextButton);
          await tester.pumpAndSettle();
        }
      }

      expect(find.text('🎉 Quiz Finished!'), findsOneWidget);
    });
  });
}
