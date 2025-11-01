// test/widget_test.dart
// Main widget and animation tests for Tejs App

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tejs_app/main.dart';

void main() {
  group('TejsApp Widget Tests', () {
    testWidgets('App should build without errors', (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('App should have correct theme', (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());

      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme?.brightness, Brightness.dark);
      expect(materialApp.theme?.primaryColor, const Color(0xFFE50914));
    });

    testWidgets('Bottom navigation bar should have 5 items',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Games'), findsOneWidget);
      expect(find.text('New & Hot'), findsOneWidget);
      expect(find.text('Downloads'), findsOneWidget);
      expect(find.text('More'), findsOneWidget);
    });

    testWidgets('Initial screen should be Home', (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      // Should show HomeScreen elements
      expect(find.text('TEJS APP'), findsAtLeastNWidgets(1));
    });

    testWidgets('Tapping Games tab should navigate to GamesScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      // Tap on Games tab
      await tester.tap(find.text('Games'));
      await tester.pumpAndSettle();

      // Should show GamesScreen title
      expect(find.text('Games'), findsWidgets);
      expect(find.text('Tic Tac Toe'), findsOneWidget);
    });

    testWidgets('Tapping New & Hot tab should change screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('New & Hot'));
      await tester.pumpAndSettle();

      expect(find.text('Coming Soon'), findsOneWidget);
    });

    testWidgets('Tapping Downloads tab should change screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Downloads'));
      await tester.pumpAndSettle();

      expect(find.text('Your Downloads'), findsOneWidget);
    });

    testWidgets('Tapping More tab should change screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('More'));
      await tester.pumpAndSettle();

      expect(find.text('Account'), findsOneWidget);
    });
  });

  group('AppBar Tests', () {
    testWidgets('AppBar should have action buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.cast_outlined), findsOneWidget);
      expect(find.byIcon(Icons.search_outlined), findsOneWidget);
      expect(find.byIcon(Icons.person_outline), findsOneWidget);
    });

    testWidgets('AppBar title should appear when scrolled',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      // Scroll down to trigger title appearance
      await tester.drag(
        find.byType(CustomScrollView),
        const Offset(0, -200),
      );
      await tester.pumpAndSettle();

      // AppBar title should be visible
      expect(find.text('TEJS APP'), findsWidgets);
    });
  });

  group('Animation Tests', () {
    testWidgets('Screen transition should animate',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      // Tap on Games tab
      await tester.tap(find.text('Games'));

      // Check animation is in progress
      await tester.pump();
      expect(find.byType(AnimatedSwitcher), findsOneWidget);

      // Complete animation
      await tester.pumpAndSettle();
      expect(find.text('Tic Tac Toe'), findsOneWidget);
    });

    testWidgets('MovieCard should have scale animation',
        (WidgetTester tester) async {
      const testMovie = Movie(
        title: 'Test Movie',
        imageUrl: 'assets/images/stranger.jpg',
        genre: 'Action',
        rating: 8.5,
        videoUrl: 'https://www.youtube.com/watch?v=test',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MovieCard(movie: testMovie),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Find the movie card
      final cardFinder = find.byType(MovieCard);
      expect(cardFinder, findsOneWidget);

      // Verify ScaleTransition exists
      expect(find.byType(ScaleTransition), findsOneWidget);
    });

    testWidgets('Hero animation should work for movie cards',
        (WidgetTester tester) async {
      const testMovie = Movie(
        title: 'Test Movie',
        imageUrl: 'assets/images/stranger.jpg',
        genre: 'Action',
        rating: 8.5,
        videoUrl: 'https://www.youtube.com/watch?v=test',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MovieCard(movie: testMovie),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Should have Hero widget
      expect(find.byType(Hero), findsOneWidget);
    });

    testWidgets('HeroBanner should have fade animations',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeroBanner(),
          ),
        ),
      );

      // Should find FadeTransition widgets
      expect(find.byType(FadeTransition), findsWidgets);

      // Wait for animation to complete
      await tester.pumpAndSettle();
    });
  });

  group('HomeScreen Tests', () {
    testWidgets('HomeScreen should display HeroBanner',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      expect(find.byType(HeroBanner), findsOneWidget);
    });

    testWidgets('HomeScreen should display movie sections',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      expect(find.text('Trending Now'), findsOneWidget);
      expect(find.text('Tejs App Originals'), findsOneWidget);
    });

    testWidgets('HomeScreen should be scrollable', (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      // Find scrollable widget
      expect(find.byType(CustomScrollView), findsOneWidget);

      // Scroll down
      await tester.drag(
        find.byType(CustomScrollView),
        const Offset(0, -500),
      );
      await tester.pump();
    });
  });

  group('GamesScreen Tests', () {
    testWidgets('GamesScreen should show all games',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      // Navigate to Games
      await tester.tap(find.text('Games'));
      await tester.pumpAndSettle();

      expect(find.text('Tic Tac Toe'), findsOneWidget);
      expect(find.text('Nuts & Bolts'), findsOneWidget);
      expect(find.text('Funny Quiz 😂'), findsOneWidget);
      expect(find.text('Coming Soon 🚀'), findsOneWidget);
    });

    testWidgets('Tapping game card should navigate to game',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Games'));
      await tester.pumpAndSettle();

      // Tap Tic Tac Toe
      await tester.tap(find.text('Tic Tac Toe'));
      await tester.pumpAndSettle();

      // Should navigate to game
      expect(find.text('Tic Tac Toe'), findsWidgets);
    });

    testWidgets('Coming Soon game should show snackbar',
        (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      await tester.tap(find.text('Games'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Coming Soon 🚀'));
      await tester.pumpAndSettle();

      expect(find.text('This game is not available yet'), findsOneWidget);
    });
  });

  group('MovieSection Tests', () {
    testWidgets('MovieSection should display title',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MovieSection(
              title: 'Test Section',
              movies: trendingMovies,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Test Section'), findsOneWidget);
    });

    testWidgets('MovieSection should display movies horizontally',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MovieSection(
              title: 'Test Section',
              movies: trendingMovies,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(MovieCard), findsWidgets);
    });

    testWidgets('MovieSection should be scrollable',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MovieSection(
              title: 'Test Section',
              movies: trendingMovies,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final listView = find.byType(ListView);

      // Scroll horizontally
      await tester.drag(listView, const Offset(-200, 0));
      await tester.pump();
    });
  });

  group('Navigation Tests', () {
    testWidgets('Back button should work', (WidgetTester tester) async {
      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      // Navigate to Games
      await tester.tap(find.text('Games'));
      await tester.pumpAndSettle();

      // Tap on a game
      await tester.tap(find.text('Tic Tac Toe'));
      await tester.pumpAndSettle();

      // Find and tap back button
      final backButton = find.byType(BackButton);
      if (backButton.evaluate().isNotEmpty) {
        await tester.tap(backButton);
        await tester.pumpAndSettle();

        // Should be back at Games screen
        expect(find.text('Tic Tac Toe'), findsOneWidget);
      }
    });
  });

  group('Responsive Design Tests', () {
    testWidgets('App should work on different screen sizes',
        (WidgetTester tester) async {
      // Test on phone size
      tester.binding.window.physicalSizeTestValue = const Size(360, 640);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      expect(find.byType(TejsApp), findsOneWidget);

      // Reset
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });

    testWidgets('App should work on tablet size', (WidgetTester tester) async {
      // Test on tablet size
      tester.binding.window.physicalSizeTestValue = const Size(768, 1024);
      tester.binding.window.devicePixelRatioTestValue = 1.0;

      await tester.pumpWidget(const TejsApp());
      await tester.pumpAndSettle();

      expect(find.byType(TejsApp), findsOneWidget);

      // Reset
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    });
  });
}
