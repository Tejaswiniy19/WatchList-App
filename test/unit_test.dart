// test/unit_test.dart
// Unit tests for data models and business logic

import 'package:flutter_test/flutter_test.dart';
import 'package:tejs_app/main.dart';

void main() {
  group('Movie Model Tests', () {
    test('Movie should be created with all properties', () {
      const movie = Movie(
        title: 'Test Movie',
        imageUrl: 'assets/images/test.jpg',
        genre: 'Action',
        rating: 8.5,
        videoUrl: 'https://www.youtube.com/watch?v=test123',
      );

      expect(movie.title, 'Test Movie');
      expect(movie.imageUrl, 'assets/images/test.jpg');
      expect(movie.genre, 'Action');
      expect(movie.rating, 8.5);
      expect(movie.videoUrl, 'https://www.youtube.com/watch?v=test123');
    });

    test('Movie should be created with empty imageUrl', () {
      const movie = Movie(
        title: 'No Image Movie',
        imageUrl: '',
        genre: 'Drama',
        rating: 7.0,
        videoUrl: 'https://www.youtube.com/watch?v=xyz',
      );

      expect(movie.imageUrl, '');
      expect(movie.title, 'No Image Movie');
    });

    test('Movie with zero rating should be valid', () {
      const movie = Movie(
        title: 'Upcoming Movie',
        imageUrl: 'assets/images/upcoming.jpg',
        genre: 'Sci-Fi',
        rating: 0.0,
        videoUrl: 'https://www.youtube.com/watch?v=upcoming',
      );

      expect(movie.rating, 0.0);
    });

    test('Movie with maximum rating should be valid', () {
      const movie = Movie(
        title: 'Perfect Movie',
        imageUrl: 'assets/images/perfect.jpg',
        genre: 'Drama',
        rating: 10.0,
        videoUrl: 'https://www.youtube.com/watch?v=perfect',
      );

      expect(movie.rating, 10.0);
    });

    test('Movie should handle special characters in title', () {
      const movie = Movie(
        title: 'Movie: The Sequel - Part 2!',
        imageUrl: 'assets/images/sequel.jpg',
        genre: 'Action',
        rating: 8.0,
        videoUrl: 'https://www.youtube.com/watch?v=sequel',
      );

      expect(movie.title, 'Movie: The Sequel - Part 2!');
    });
  });

  group('Trending Movies List Tests', () {
    test('Trending movies list should not be empty', () {
      expect(trendingMoviesForTest.isNotEmpty, true);
    });

    test('Trending movies should have at least 5 items', () {
      expect(trendingMoviesForTest.length, greaterThanOrEqualTo(5));
    });

    test('All trending movies should have valid titles', () {
      for (var movie in trendingMoviesForTest) {
        expect(movie.title.isNotEmpty, true);
        expect(movie.title.length, greaterThan(0));
      }
    });

    test('All trending movies should have valid ratings', () {
      for (var movie in trendingMoviesForTest) {
        expect(movie.rating, greaterThanOrEqualTo(0));
        expect(movie.rating, lessThanOrEqualTo(10));
      }
    });

    test('All trending movies should have genres', () {
      for (var movie in trendingMoviesForTest) {
        expect(movie.genre.isNotEmpty, true);
      }
    });

    test('All trending movies should have video URLs', () {
      for (var movie in trendingMoviesForTest) {
        expect(movie.videoUrl.isNotEmpty, true);
        expect(movie.videoUrl.contains('youtube.com'), true);
      }
    });

    test('Trending movies should have image URLs', () {
      for (var movie in trendingMoviesForTest) {
        expect(movie.imageUrl.isNotEmpty, true);
        expect(movie.imageUrl.contains('assets/images'), true);
      }
    });

    test('Stranger Things should be first in trending', () {
      expect(trendingMoviesForTest.first.title, 'Stranger Things');
      expect(trendingMoviesForTest.first.genre, 'Sci-Fi');
      expect(trendingMoviesForTest.first.rating, 8.7);
    });
  });

  group('Tejs Originals List Tests', () {
    test('Tejs originals list should not be empty', () {
      expect(tejsOriginalsForTest.isNotEmpty, true);
    });

    test('Tejs originals should have at least 5 items', () {
      expect(tejsOriginalsForTest.length, greaterThanOrEqualTo(5));
    });

    test('All tejs originals should have valid properties', () {
      for (var movie in tejsOriginalsForTest) {
        expect(movie.title.isNotEmpty, true);
        expect(movie.genre.isNotEmpty, true);
        expect(movie.rating, greaterThanOrEqualTo(0));
        expect(movie.videoUrl.isNotEmpty, true);
        expect(movie.imageUrl.isNotEmpty, true);
      }
    });

    test('House of Cards should be in tejs originals', () {
      final houseOfCards = tejsOriginalsForTest.firstWhere(
        (movie) => movie.title == 'House of Cards',
        orElse: () => const Movie(
          title: '',
          imageUrl: '',
          genre: '',
          rating: 0,
          videoUrl: '',
        ),
      );
      expect(houseOfCards.title, 'House of Cards');
      expect(houseOfCards.genre, 'Drama');
    });
  });

  group('Continue Watching List Tests', () {
    test('Continue watching list should not be empty', () {
      expect(continueWatchingForTest.isNotEmpty, true);
    });

    test('All continue watching items should have valid properties', () {
      for (var movie in continueWatchingForTest) {
        expect(movie.title.isNotEmpty, true);
        expect(movie.genre.isNotEmpty, true);
        expect(movie.rating, greaterThanOrEqualTo(0));
        expect(movie.videoUrl.isNotEmpty, true);
      }
    });

    test('Breaking Bad should have highest rating in continue watching', () {
      var highestRated = continueWatchingForTest.first;
      for (var movie in continueWatchingForTest) {
        if (movie.rating > highestRated.rating) {
          highestRated = movie;
        }
      }
      expect(highestRated.title, 'Breaking Bad');
      expect(highestRated.rating, 9.5);
    });
  });

  group('Recommended Movies List Tests', () {
    test('For you list should not be empty', () {
      expect(forYouForTest.isNotEmpty, true);
    });

    test('All recommended movies should have valid properties', () {
      for (var movie in forYouForTest) {
        expect(movie.title.isNotEmpty, true);
        expect(movie.genre.isNotEmpty, true);
        expect(movie.rating, greaterThanOrEqualTo(0));
        expect(movie.videoUrl.isNotEmpty, true);
        expect(movie.imageUrl.isNotEmpty, true);
      }
    });

    test('Recommended movies should have high ratings', () {
      for (var movie in forYouForTest) {
        expect(movie.rating, greaterThanOrEqualTo(8.0));
      }
    });
  });

  group('Action Movies List Tests', () {
    test('Action movies list should not be empty', () {
      expect(actionMoviesForTest.isNotEmpty, true);
    });

    test('All action movies should have Action genre', () {
      for (var movie in actionMoviesForTest) {
        expect(movie.genre, 'Action');
      }
    });

    test('Action movies should have valid properties', () {
      for (var movie in actionMoviesForTest) {
        expect(movie.title.isNotEmpty, true);
        expect(movie.rating, greaterThanOrEqualTo(0));
        expect(movie.videoUrl.isNotEmpty, true);
        expect(movie.imageUrl.isNotEmpty, true);
      }
    });

    test('John Wick should be in action movies', () {
      final johnWick = actionMoviesForTest.firstWhere(
        (movie) => movie.title == 'John Wick',
      );
      expect(johnWick.genre, 'Action');
    });
  });

  group('Comedy Movies List Tests', () {
    test('Comedy movies list should not be empty', () {
      expect(comedyMoviesForTest.isNotEmpty, true);
    });

    test('All comedy movies should have Comedy genre', () {
      for (var movie in comedyMoviesForTest) {
        expect(movie.genre, 'Comedy');
      }
    });

    test('Comedy movies should have valid properties', () {
      for (var movie in comedyMoviesForTest) {
        expect(movie.title.isNotEmpty, true);
        expect(movie.rating, greaterThanOrEqualTo(0));
        expect(movie.videoUrl.isNotEmpty, true);
        expect(movie.imageUrl.isNotEmpty, true);
      }
    });
  });

  group('Games Content List Tests', () {
    test('Games content list should not be empty', () {
      expect(gamesContentForTest.isNotEmpty, true);
    });

    test('Games content should have at least 3 items', () {
      expect(gamesContentForTest.length, greaterThanOrEqualTo(3));
    });

    test('All games should have valid properties', () {
      for (var game in gamesContentForTest) {
        expect(game.title.isNotEmpty, true);
        expect(game.genre.isNotEmpty, true);
        expect(game.rating, greaterThanOrEqualTo(0));
        expect(game.videoUrl.isNotEmpty, true);
        expect(game.imageUrl.isNotEmpty, true);
      }
    });

    test('The Last of Us should be in games content', () {
      final lastOfUs = gamesContentForTest.firstWhere(
        (game) => game.title == 'The Last of Us',
        orElse: () => const Movie(
          title: '',
          imageUrl: '',
          genre: '',
          rating: 0,
          videoUrl: '',
        ),
      );
      expect(lastOfUs.title, 'The Last of Us');
    });
  });

  group('Studies Content List Tests', () {
    test('Studies content list should not be empty', () {
      expect(studiesContentForTest.isNotEmpty, true);
    });

    test('All studies content should have valid properties', () {
      for (var content in studiesContentForTest) {
        expect(content.title.isNotEmpty, true);
        expect(content.genre.isNotEmpty, true);
        expect(content.rating, greaterThanOrEqualTo(0));
        expect(content.videoUrl.isNotEmpty, true);
        expect(content.imageUrl.isNotEmpty, true);
      }
    });

    test('Khan Academy should be in studies content', () {
      final khanAcademy = studiesContentForTest.firstWhere(
        (content) => content.title == 'Khan Academy',
      );
      expect(khanAcademy.genre, 'Educational');
    });
  });

  group('Fitness Content List Tests', () {
    test('Fitness content list should not be empty', () {
      expect(fitnessContentForTest.isNotEmpty, true);
    });

    test('All fitness content should have valid properties', () {
      for (var content in fitnessContentForTest) {
        expect(content.title.isNotEmpty, true);
        expect(content.genre.isNotEmpty, true);
        expect(content.rating, greaterThanOrEqualTo(0));
        expect(content.videoUrl.isNotEmpty, true);
        expect(content.imageUrl.isNotEmpty, true);
      }
    });

    test('Fitness content should have at least 3 items', () {
      expect(fitnessContentForTest.length, greaterThanOrEqualTo(3));
    });
  });

  group('Recipes Content List Tests', () {
    test('Recipes content list should not be empty', () {
      expect(recipesContentForTest.isNotEmpty, true);
    });

    test('All recipes should have valid properties', () {
      for (var recipe in recipesContentForTest) {
        expect(recipe.title.isNotEmpty, true);
        expect(recipe.genre.isNotEmpty, true);
        expect(recipe.rating, greaterThanOrEqualTo(0));
        expect(recipe.videoUrl.isNotEmpty, true);
        expect(recipe.imageUrl.isNotEmpty, true);
      }
    });

    test('Italian Pasta Masterclass should be in recipes', () {
      final pasta = recipesContentForTest.firstWhere(
        (recipe) => recipe.title.contains('Pasta'),
      );
      expect(pasta.genre, 'Italian Cuisine');
    });
  });

  group('Upcoming Movies List Tests', () {
    test('Upcoming movies list should not be empty', () {
      expect(upcomingMoviesForTest.isNotEmpty, true);
    });

    test('Upcoming movies should have at least 5 items', () {
      expect(upcomingMoviesForTest.length, greaterThanOrEqualTo(5));
    });

    test('All upcoming movies should have valid properties', () {
      for (var movie in upcomingMoviesForTest) {
        expect(movie.title.isNotEmpty, true);
        expect(movie.genre.isNotEmpty, true);
        expect(movie.videoUrl.isNotEmpty, true);
        expect(movie.imageUrl.isNotEmpty, true);
      }
    });

    test('Upcoming movies can have zero rating', () {
      for (var movie in upcomingMoviesForTest) {
        expect(movie.rating, greaterThanOrEqualTo(0));
      }
    });
  });

  group('Downloadable Movies List Tests', () {
    test('Downloadable movies list should not be empty', () {
      expect(downloadableMoviesForTest.isNotEmpty, true);
    });

    test('All downloadable movies should have valid properties', () {
      for (var movie in downloadableMoviesForTest) {
        expect(movie.title.isNotEmpty, true);
        expect(movie.genre.isNotEmpty, true);
        expect(movie.rating, greaterThanOrEqualTo(0));
        expect(movie.videoUrl.isNotEmpty, true);
        expect(movie.imageUrl.isNotEmpty, true);
      }
    });

    test('Downloadable movies should have at least 5 items', () {
      expect(downloadableMoviesForTest.length, greaterThanOrEqualTo(5));
    });
  });

  group('Data Validation Tests', () {
    test('No movie should have null or empty title', () {
      final allMovies = [
        ...trendingMoviesForTest,
        ...tejsOriginalsForTest,
        ...continueWatchingForTest,
        ...forYouForTest,
        ...actionMoviesForTest,
        ...comedyMoviesForTest,
        ...gamesContentForTest,
        ...studiesContentForTest,
        ...fitnessContentForTest,
        ...recipesContentForTest,
        ...upcomingMoviesForTest,
        ...downloadableMoviesForTest,
      ];

      for (var movie in allMovies) {
        expect(movie.title.isNotEmpty, true);
      }
    });

    test('No movie should have negative rating', () {
      final allMovies = [
        ...trendingMoviesForTest,
        ...tejsOriginalsForTest,
        ...continueWatchingForTest,
        ...forYouForTest,
        ...actionMoviesForTest,
        ...comedyMoviesForTest,
      ];

      for (var movie in allMovies) {
        expect(movie.rating, greaterThanOrEqualTo(0));
      }
    });

    test('All YouTube URLs should be valid format', () {
      final allMovies = [
        ...trendingMoviesForTest,
        ...tejsOriginalsForTest,
        ...continueWatchingForTest,
      ];

      for (var movie in allMovies) {
        expect(
          movie.videoUrl.contains('youtube.com') ||
              movie.videoUrl.contains('youtu.be'),
          true,
        );
      }
    });

    test('All image paths should start with assets/', () {
      final allMovies = [
        ...trendingMoviesForTest,
        ...tejsOriginalsForTest,
        ...continueWatchingForTest,
      ];

      for (var movie in allMovies) {
        if (movie.imageUrl.isNotEmpty) {
          expect(movie.imageUrl.startsWith('assets/'), true);
        }
      }
    });
  });

  group('Movie List Statistics Tests', () {
    test('Calculate average rating of trending movies', () {
      double totalRating = 0;
      for (var movie in trendingMoviesForTest) {
        totalRating += movie.rating;
      }
      double average = totalRating / trendingMoviesForTest.length;

      expect(average, greaterThan(7.0)); // Should be high quality content
    });

    test('Count unique genres across all movies', () {
      final allMovies = [
        ...trendingMoviesForTest,
        ...tejsOriginalsForTest,
        ...continueWatchingForTest,
      ];

      final genres = <String>{};
      for (var movie in allMovies) {
        genres.add(movie.genre);
      }

      expect(genres.length, greaterThan(3)); // Should have variety
    });

    test('Find highest rated movie across all lists', () {
      final allMovies = [
        ...trendingMoviesForTest,
        ...tejsOriginalsForTest,
        ...continueWatchingForTest,
        ...forYouForTest,
      ];

      Movie highestRated = allMovies.first;
      for (var movie in allMovies) {
        if (movie.rating > highestRated.rating) {
          highestRated = movie;
        }
      }

      expect(highestRated.rating, greaterThanOrEqualTo(9.0));
    });

    test('Count total number of unique movies', () {
      final allTitles = <String>{};

      final allMovies = [
        ...trendingMoviesForTest,
        ...tejsOriginalsForTest,
        ...continueWatchingForTest,
        ...forYouForTest,
        ...actionMoviesForTest,
        ...comedyMoviesForTest,
      ];

      for (var movie in allMovies) {
        allTitles.add(movie.title);
      }

      expect(allTitles.length, greaterThan(20));
    });
  });

  group('Edge Cases Tests', () {
    test('Movie with special characters in URL', () {
      const movie = Movie(
        title: 'Test',
        imageUrl: 'assets/images/test.jpg',
        genre: 'Test',
        rating: 8.0,
        videoUrl: 'https://www.youtube.com/watch?v=abc-123_DEF',
      );

      expect(movie.videoUrl.contains('watch?v='), true);
    });

    test('Movie with long title', () {
      const movie = Movie(
        title:
            'This is a Very Long Movie Title That Should Still Work Properly',
        imageUrl: 'assets/images/long.jpg',
        genre: 'Drama',
        rating: 7.5,
        videoUrl: 'https://www.youtube.com/watch?v=long',
      );

      expect(movie.title.length, greaterThan(50));
    });

    test('Movie with decimal rating', () {
      const movie = Movie(
        title: 'Precise Rating',
        imageUrl: 'assets/images/precise.jpg',
        genre: 'Drama',
        rating: 8.73,
        videoUrl: 'https://www.youtube.com/watch?v=precise',
      );

      expect(movie.rating, 8.73);
    });
  });
}
