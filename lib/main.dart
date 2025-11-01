import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'tic_tac_toe_game.dart';
import 'nuts_and_bolts.dart';
import 'funny_quiz_game.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const TejsApp());
}

class Movie {
  final String title;
  final String imageUrl;
  final String genre;
  final double rating;
  final String videoUrl;

  const Movie({
    required this.title,
    required this.imageUrl,
    required this.genre,
    required this.rating,
    required this.videoUrl,
  });
}

// Movie lists - Full original lists
List<Movie> trendingMovies = [
  Movie(
    title: 'Stranger Things',
    imageUrl: 'assets/images/stranger.jpg',
    genre: 'Sci-Fi',
    rating: 8.7,
    videoUrl: 'https://www.youtube.com/watch?v=b9EkMc79ZSU',
  ),
  Movie(
    title: 'The Witcher',
    imageUrl: 'assets/images/the-witcher.jpg',
    genre: 'Fantasy',
    rating: 8.2,
    videoUrl: 'https://www.youtube.com/watch?v=ndl1W4ltcmg',
  ),
  Movie(
    title: 'Money Heist',
    imageUrl: 'assets/images/Money Heist.jpg',
    genre: 'Crime',
    rating: 8.3,
    videoUrl: 'https://www.youtube.com/watch?v=_InqQJRqGW4',
  ),
  Movie(
    title: 'Squid Game',
    imageUrl: 'assets/images/Squid Game.jpg',
    genre: 'Thriller',
    rating: 8.0,
    videoUrl: 'https://www.youtube.com/watch?v=oqxAJKy0ii4',
  ),
  Movie(
    title: 'Bridgerton',
    imageUrl: 'assets/images/Bridgerton.jpg',
    genre: 'Romance',
    rating: 7.3,
    videoUrl: 'https://www.youtube.com/watch?v=gpv7ayf_tyE',
  ),
  Movie(
    title: 'Ozark',
    imageUrl: 'assets/images/ozark.jpg',
    genre: 'Crime',
    rating: 8.4,
    videoUrl: 'https://www.youtube.com/watch?v=5hAXVqrljbs',
  ),
  Movie(
    title: 'The Crown',
    imageUrl: 'assets/images/The Crown.png',
    genre: 'Biography',
    rating: 8.6,
    videoUrl: 'https://www.youtube.com/watch?v=JWtnJjn6ng0',
  ),
  Movie(
    title: 'Narcos',
    imageUrl: 'assets/images/Narcos.webp',
    genre: 'Crime',
    rating: 8.8,
    videoUrl: 'https://www.youtube.com/watch?v=xl8zdCY-abw',
  ),
];

List<Movie> tejsOriginals = [
  Movie(
    title: 'House of Cards',
    imageUrl: 'assets/images/House of Cards.jpg',
    genre: 'Drama',
    rating: 8.7,
    videoUrl: 'https://www.youtube.com/watch?v=8QnMmpfKWvo',
  ),
  Movie(
    title: 'Orange Is the New Black',
    imageUrl: 'assets/images/Orange is the New Black.webp',
    genre: 'Comedy',
    rating: 8.1,
    videoUrl: 'https://www.youtube.com/watch?v=vY0qzXi5oJg',
  ),
  Movie(
    title: 'Narcos',
    imageUrl: 'assets/images/Narcos.webp',
    genre: 'Crime',
    rating: 8.8,
    videoUrl: 'https://www.youtube.com/watch?v=xl8zdCY-abw',
  ),
  Movie(
    title: 'The Crown',
    imageUrl: 'assets/images/The Crown.png',
    genre: 'Biography',
    rating: 8.6,
    videoUrl: 'https://www.youtube.com/watch?v=JWtnJjn6ng0',
  ),
  Movie(
    title: 'Black Mirror',
    imageUrl: 'assets/images/black_mirror.jpg',
    genre: 'Sci-Fi',
    rating: 8.8,
    videoUrl: 'https://www.youtube.com/watch?v=jDiYGjp5iFg',
  ),
  Movie(
    title: 'Dark',
    imageUrl: 'assets/images/dark.jpg',
    genre: 'Mystery',
    rating: 8.8,
    videoUrl: 'https://www.youtube.com/watch?v=rrwycJ08PSA',
  ),
  Movie(
    title: 'Mindhunter',
    imageUrl: 'assets/images/Mindhunter.jpg',
    genre: 'Crime',
    rating: 8.6,
    videoUrl: 'https://www.youtube.com/watch?v=evdxW6OdL_s',
  ),
  Movie(
    title: 'The Umbrella Academy',
    imageUrl: 'assets/images/The Umbrella Academy.jpg',
    genre: 'Action',
    rating: 7.9,
    videoUrl: 'https://www.youtube.com/watch?v=0DAmWHxeoKw',
  ),
];

List<Movie> continueWatching = [
  Movie(
    title: 'Breaking Bad',
    imageUrl: 'assets/images/Breaking Bad.jpg',
    genre: 'Crime',
    rating: 9.5,
    videoUrl: 'https://www.youtube.com/watch?v=HhesaQXLuRY',
  ),
  Movie(
    title: 'The Office',
    imageUrl: 'assets/images/The Office.jpg',
    genre: 'Comedy',
    rating: 8.9,
    videoUrl: 'https://www.youtube.com/watch?v=LHOtME2DL4g',
  ),
  Movie(
    title: 'Friends',
    imageUrl: 'assets/images/friends.jpg',
    genre: 'Comedy',
    rating: 8.9,
    videoUrl: 'https://www.youtube.com/watch?v=IEEbUzffzrk',
  ),
  Movie(
    title: 'Sherlock',
    imageUrl: 'assets/images/Sherlock.jpg',
    genre: 'Mystery',
    rating: 9.1,
    videoUrl: 'https://www.youtube.com/watch?v=qlcWFoNqZHc',
  ),
  Movie(
    title: 'Game of Thrones',
    imageUrl: 'assets/images/Game of Thrones.jpg',
    genre: 'Fantasy',
    rating: 9.3,
    videoUrl: 'https://www.youtube.com/watch?v=KPLWWIOCOOQ',
  ),
  Movie(
    title: 'Better Call Saul',
    imageUrl: 'assets/images/Better Call Saul.webp',
    genre: 'Crime',
    rating: 8.8,
    videoUrl: 'https://www.youtube.com/watch?v=HN4oydykJFc',
  ),
];

List<Movie> forYou = [
  Movie(
    title: 'The Matrix',
    imageUrl: 'assets/images/The Matrix.webp',
    genre: 'Sci-Fi',
    rating: 8.7,
    videoUrl: 'https://www.youtube.com/watch?v=vKQi3bBA1y8',
  ),
  Movie(
    title: 'Inception',
    imageUrl: 'assets/images/Inception.webp',
    genre: 'Sci-Fi',
    rating: 8.8,
    videoUrl: 'https://www.youtube.com/watch?v=YoHD9XEInc0',
  ),
  Movie(
    title: 'Interstellar',
    imageUrl: 'assets/images/Interstellar.jpg',
    genre: 'Sci-Fi',
    rating: 8.6,
    videoUrl: 'https://www.youtube.com/watch?v=zSWdZVtXT7E',
  ),
  Movie(
    title: 'The Dark Knight',
    imageUrl: 'assets/images/The Dark Knight.webp',
    genre: 'Action',
    rating: 9.0,
    videoUrl: 'https://www.youtube.com/watch?v=EXeTwQWrcwY',
  ),
  Movie(
    title: 'Pulp Fiction',
    imageUrl: 'assets/images/Pulp Fiction.jpg',
    genre: 'Crime',
    rating: 8.9,
    videoUrl: 'https://www.youtube.com/watch?v=s7EdQ4FqbhY',
  ),
  Movie(
    title: 'Fight Club',
    imageUrl: 'assets/images/Fight Club.jpg',
    genre: 'Drama',
    rating: 8.8,
    videoUrl: 'https://www.youtube.com/watch?v=SUXWAEX2jlg',
  ),
];

List<Movie> actionMovies = [
  Movie(
    title: 'John Wick',
    imageUrl: 'assets/images/John Wick.jpg',
    genre: 'Action',
    rating: 7.4,
    videoUrl: 'https://www.youtube.com/watch?v=C0BMx-qxsP4',
  ),
  Movie(
    title: 'Mad Max: Fury Road',
    imageUrl: 'assets/images/Mad Max.jpg',
    genre: 'Action',
    rating: 8.1,
    videoUrl: 'https://www.youtube.com/watch?v=hEJnMQG9ev8',
  ),
  Movie(
    title: 'Die Hard',
    imageUrl: 'assets/images/Die Hard.jpg',
    genre: 'Action',
    rating: 8.2,
    videoUrl: 'https://www.youtube.com/watch?v=2TQ-pOvI6Xo',
  ),
  Movie(
    title: 'Terminator 2',
    imageUrl: 'assets/images/Terminator 2.jpg',
    genre: 'Action',
    rating: 8.5,
    videoUrl: 'https://www.youtube.com/watch?v=7QXDPzx71jQ',
  ),
  Movie(
    title: 'The Avengers',
    imageUrl: 'assets/images/The Avengers.jpg',
    genre: 'Action',
    rating: 8.0,
    videoUrl: 'https://www.youtube.com/watch?v=eOrNdBpGMv8',
  ),
  Movie(
    title: 'Mission Impossible',
    imageUrl: 'assets/images/Mission Impossible.jpg',
    genre: 'Action',
    rating: 7.1,
    videoUrl: 'https://www.youtube.com/watch?v=wb49-oV0F78',
  ),
];

List<Movie> comedyMovies = [
  Movie(
    title: 'Superbad',
    imageUrl: 'assets/images/Superbad.jpg',
    genre: 'Comedy',
    rating: 7.6,
    videoUrl: 'https://www.youtube.com/watch?v=4eaZ_48ZYog',
  ),
  Movie(
    title: 'Anchorman',
    imageUrl: 'assets/images/Anchorman.jpg',
    genre: 'Comedy',
    rating: 7.2,
    videoUrl: 'https://www.youtube.com/watch?v=-T3wnP91OnI',
  ),
  Movie(
    title: 'Step Brothers',
    imageUrl: 'assets/images/Step Brothers.jpg',
    genre: 'Comedy',
    rating: 6.9,
    videoUrl: 'https://www.youtube.com/watch?v=ANjenc4WQ_Q',
  ),
  Movie(
    title: 'Borat',
    imageUrl: 'assets/images/Borat.jpg',
    genre: 'Comedy',
    rating: 7.3,
    videoUrl: 'https://www.youtube.com/watch?v=vlnUa_dNsZE',
  ),
  Movie(
    title: 'Tropic Thunder',
    imageUrl: 'assets/images/Tropic Thunder.jpg',
    genre: 'Comedy',
    rating: 7.0,
    videoUrl: 'https://www.youtube.com/watch?v=T-6YhRZowgc',
  ),
];

List<Movie> gamesContent = [
  Movie(
    title: 'The Last of Us',
    imageUrl: 'assets/images/The_Last_of_Us_Part_1_cover.jpg',
    genre: 'Action Adventure',
    rating: 9.5,
    videoUrl: 'https://www.youtube.com/watch?v=W01L70IGBgE',
  ),
  Movie(
    title: 'Cyberpunk 2077',
    imageUrl: 'assets/images/cyberpunk-2077.jpg',
    genre: 'RPG',
    rating: 8.2,
    videoUrl: 'https://www.youtube.com/watch?v=8X2kIfS6fb8',
  ),
  Movie(
    title: 'Elden Ring',
    imageUrl: 'assets/images/eldenring.jpeg',
    genre: 'Action RPG',
    rating: 9.7,
    videoUrl: 'https://www.youtube.com/watch?v=E3Huy2cdih0',
  ),
  Movie(
    title: 'God of War Ragnarök',
    imageUrl: 'assets/images/god-of-war-ragnarok-.jpg',
    genre: 'Action Adventure',
    rating: 9.4,
    videoUrl: 'https://www.youtube.com/watch?v=EE-4GvjKcfs',
  ),
  Movie(
    title: 'Horizon Forbidden West',
    imageUrl: 'assets/images/horizon.jpeg',
    genre: 'Action RPG',
    rating: 9.0,
    videoUrl: 'https://www.youtube.com/watch?v=Lq594XmpPBg',
  ),
];

List<Movie> studiesContent = [
  Movie(
    title: 'Khan Academy',
    imageUrl: 'assets/images/khanAcademy.png',
    genre: 'Educational',
    rating: 9.2,
    videoUrl: 'https://www.youtube.com/watch?v=pZ60FSlf1lE',
  ),
  Movie(
    title: 'Crash Course',
    imageUrl: 'assets/images/crash_course.jpg',
    genre: 'Educational',
    rating: 9.0,
    videoUrl: 'https://www.youtube.com/watch?v=1o8oIELbNxE',
  ),
  Movie(
    title: 'TED Talks',
    imageUrl: 'assets/images/TED_Talks.jpg',
    genre: 'Inspirational',
    rating: 9.3,
    videoUrl: 'https://www.youtube.com/watch?v=5MgBikgcWnY',
  ),
  Movie(
    title: 'Coursera',
    imageUrl: 'assets/images/coursera.webp',
    genre: 'Online Learning',
    rating: 8.8,
    videoUrl: 'https://www.youtube.com/watch?v=B0JQFcZfGlY',
  ),
  Movie(
    title: 'MIT OpenCourseWare',
    imageUrl: 'assets/images/mit_ocw.jpeg',
    genre: 'University Courses',
    rating: 9.5,
    videoUrl: 'https://www.youtube.com/watch?v=7K1sB5pE1CY',
  ),
];

List<Movie> fitnessContent = [
  Movie(
    title: '30-Day Yoga Challenge',
    imageUrl: 'assets/images/yoga.jpeg',
    genre: 'Yoga',
    rating: 8.9,
    videoUrl: 'https://www.youtube.com/watch?v=s2NQhpFGIOg',
  ),
  Movie(
    title: 'HIIT Workout',
    imageUrl: 'assets/images/Hiit_workout.jpeg',
    genre: 'Cardio',
    rating: 8.7,
    videoUrl: 'https://www.youtube.com/watch?v=ml6cT4AZdqI',
  ),
  Movie(
    title: 'Strength Training',
    imageUrl: 'assets/images/strength.jpeg',
    genre: 'Weight Lifting',
    rating: 8.8,
    videoUrl: 'https://www.youtube.com/watch?v=GZbfZ033f74',
  ),
  Movie(
    title: 'Meditation Guide',
    imageUrl: 'assets/images/meditation.jpg',
    genre: 'Mindfulness',
    rating: 9.1,
    videoUrl: 'https://www.youtube.com/watch?v=inpok4MKVLM',
  ),
  Movie(
    title: 'Nutrition Basics',
    imageUrl: 'assets/images/nutrition.jpeg',
    genre: 'Diet & Health',
    rating: 8.6,
    videoUrl: 'https://www.youtube.com/watch?v=Gmh_xMMJ2Pw',
  ),
];

List<Movie> recipesContent = [
  Movie(
    title: 'Italian Pasta Masterclass',
    imageUrl: 'assets/images/pasta.jpeg',
    genre: 'Italian Cuisine',
    rating: 9.0,
    videoUrl: 'https://www.youtube.com/watch?v=J-LUf4YfTd4',
  ),
  Movie(
    title: 'Baking Basics',
    imageUrl: 'assets/images/baking_basics.jpeg',
    genre: 'Desserts',
    rating: 8.8,
    videoUrl: 'https://www.youtube.com/watch?v=Wbx5sYhjX-I',
  ),
  Movie(
    title: 'Vegetarian Recipes',
    imageUrl: 'assets/images/vegetarian.jpeg',
    genre: 'Vegetarian',
    rating: 8.7,
    videoUrl: 'https://www.youtube.com/watch?v=2c2nWbGQkq8',
  ),
  Movie(
    title: 'Quick & Easy Meals',
    imageUrl: 'assets/images/quick_and_easy.jpeg',
    genre: 'Everyday Cooking',
    rating: 8.5,
    videoUrl: 'https://www.youtube.com/watch?v=3N1HrQnWn_g',
  ),
  Movie(
    title: 'Gourmet Cooking',
    imageUrl: 'assets/images/dinner.jpeg',
    genre: 'Fine Dining',
    rating: 9.2,
    videoUrl: 'https://www.youtube.com/watch?v=6kUc5Wr0x_k',
  ),
];

List<Movie> upcomingMovies = [
  Movie(
    title: 'Avatar: The Way of Water',
    imageUrl: 'assets/images/avatar.jpg',
    genre: 'Sci-Fi',
    rating: 0.0,
    videoUrl: 'https://www.youtube.com/watch?v=d9MyW72ELq0',
  ),
  Movie(
    title: 'Black Panther: Wakanda Forever',
    imageUrl: 'assets/images/black_panther.jpg',
    genre: 'Action',
    rating: 0.0,
    videoUrl: 'https://www.youtube.com/watch?v=_Z3QKkl1WyM',
  ),
  Movie(
    title: 'The Flash',
    imageUrl: 'assets/images/flash.jpg',
    genre: 'Action',
    rating: 0.0,
    videoUrl: 'https://www.youtube.com/watch?v=hebWYacbdvc',
  ),
  Movie(
    title: 'Indiana Jones 5',
    imageUrl: 'assets/images/indiana_jones.jpeg',
    genre: 'Adventure',
    rating: 0.0,
    videoUrl: 'https://www.youtube.com/watch?v=ZgCO3X5uocA',
  ),
  Movie(
    title: 'Mission: Impossible 7',
    imageUrl: 'assets/images/mission_impossible.jpeg',
    genre: 'Action',
    rating: 0.0,
    videoUrl: 'https://www.youtube.com/watch?v=avz06PDqDbM',
  ),
  Movie(
    title: 'John Wick: Chapter 4',
    imageUrl: 'assets/images/john_wick.jpeg',
    genre: 'Action',
    rating: 0.0,
    videoUrl: 'https://www.youtube.com/watch?v=qEVUtrk8_B4',
  ),
  Movie(
    title: 'Dune: Part Two',
    imageUrl: 'assets/images/dune.jpeg',
    genre: 'Sci-Fi',
    rating: 0.0,
    videoUrl: 'https://www.youtube.com/watch?v=U2Qp5pL3ovA',
  ),
  Movie(
    title: 'The Batman 2',
    imageUrl: 'assets/images/batman.jpeg',
    genre: 'Action',
    rating: 0.0,
    videoUrl: 'https://www.youtube.com/watch?v=4nXbD2fH8sc',
  ),
  Movie(
    title: 'Fantastic Beasts 3',
    imageUrl: 'assets/images/fantastic_beasts.jpeg',
    genre: 'Fantasy',
    rating: 0.0,
    videoUrl: 'https://www.youtube.com/watch?v=Y9dr2zw-TXQ',
  ),
];

List<Movie> downloadableMovies = [
  Movie(
    title: 'Stranger Things',
    imageUrl: 'assets/images/stranger.jpg',
    genre: 'Sci-Fi',
    rating: 8.7,
    videoUrl: 'https://www.youtube.com/watch?v=b9EkMc79ZSU',
  ),
  Movie(
    title: 'The Witcher',
    imageUrl: 'assets/images/the-witcher.jpg',
    genre: 'Fantasy',
    rating: 8.2,
    videoUrl: 'https://www.youtube.com/watch?v=ndl1W4ltcmg',
  ),
  Movie(
    title: 'Money Heist',
    imageUrl: 'assets/images/Money Heist.jpg',
    genre: 'Crime',
    rating: 8.3,
    videoUrl: 'https://www.youtube.com/watch?v=_InqQJRqGW4',
  ),
  Movie(
    title: 'Squid Game',
    imageUrl: 'assets/images/Squid Game.jpg',
    genre: 'Thriller',
    rating: 8.0,
    videoUrl: 'https://www.youtube.com/watch?v=oqxAJKy0ii4',
  ),
  Movie(
    title: 'Breaking Bad',
    imageUrl: 'assets/images/Breaking Bad.jpg',
    genre: 'Crime',
    rating: 9.5,
    videoUrl: 'https://www.youtube.com/watch?v=HhesaQXLuRY',
  ),
  Movie(
    title: 'Game of Thrones',
    imageUrl: 'assets/images/Game of Thrones.jpg',
    genre: 'Fantasy',
    rating: 9.3,
    videoUrl: 'https://www.youtube.com/watch?v=KPLWWIOCOOQ',
  ),
  Movie(
    title: 'Terminator 2',
    imageUrl: 'assets/images/Terminator 2.jpg',
    genre: 'Action',
    rating: 8.5,
    videoUrl: 'https://www.youtube.com/watch?v=7QXDPzx71jQ',
  ),
  Movie(
    title: 'The Avengers',
    imageUrl: 'assets/images/The Avengers.jpg',
    genre: 'Action',
    rating: 8.0,
    videoUrl: 'https://www.youtube.com/watch?v=eOrNdBpGMv8',
  ),
  Movie(
    title: 'Mission Impossible',
    imageUrl: 'assets/images/Mission Impossible.jpg',
    genre: 'Action',
    rating: 7.1,
    videoUrl: 'https://www.youtube.com/watch?v=wb49-oV0F78',
  ),
];

// Make Movie class and lists available for testing
List<Movie> get trendingMoviesForTest => trendingMovies;
List<Movie> get tejsOriginalsForTest => tejsOriginals;
List<Movie> get continueWatchingForTest => continueWatching;
List<Movie> get forYouForTest => forYou;
List<Movie> get actionMoviesForTest => actionMovies;
List<Movie> get comedyMoviesForTest => comedyMovies;
List<Movie> get gamesContentForTest => gamesContent;
List<Movie> get studiesContentForTest => studiesContent;
List<Movie> get fitnessContentForTest => fitnessContent;
List<Movie> get recipesContentForTest => recipesContent;
List<Movie> get upcomingMoviesForTest => upcomingMovies;
List<Movie> get downloadableMoviesForTest => downloadableMovies;

// Connectivity function
Future<bool> _checkConnectivity() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

class TejsApp extends StatelessWidget {
  const TejsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tejs App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFFE50914),
        scaffoldBackgroundColor: const Color(0xFF141414),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white, size: 26),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF141414),
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xFF8C8C8C),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
        ),
        fontFamily: 'Helvetica',
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const TejsHomePage(),
    );
  }
}

class TejsHomePage extends StatefulWidget {
  const TejsHomePage({super.key});

  @override
  State<TejsHomePage> createState() => _TejsHomePageState();
}

class _TejsHomePageState extends State<TejsHomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();
  bool _showAppBarTitle = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();

    _scrollController.addListener(() {
      if (_scrollController.offset > 150 && !_showAppBarTitle) {
        setState(() => _showAppBarTitle = true);
      } else if (_scrollController.offset <= 150 && _showAppBarTitle) {
        setState(() => _showAppBarTitle = false);
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: _showAppBarTitle
            ? const Color(0xFF141414).withOpacity(0.95)
            : Colors.transparent,
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _showAppBarTitle
              ? const Text(
                  'TEJS APP',
                  key: ValueKey('app-bar-title'),
                  style: TextStyle(
                    color: Color(0xFFE50914),
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    letterSpacing: 2.0,
                  ),
                )
              : const SizedBox.shrink(key: ValueKey('app-bar-empty')),
        ),
        actions: [
          ScaleAnimation(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.cast_outlined),
                onPressed: () {},
                iconSize: 28,
              ),
            ),
          ),
          ScaleAnimation(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () {},
                iconSize: 28,
              ),
            ),
          ),
          ScaleAnimation(
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE50914), Color(0xFFB20710)],
                    ),
                  ),
                  child: const Icon(
                    Icons.person_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: _buildBody(),
      ),
      bottomNavigationBar: SlideUpAnimation(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF141414),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xFF8C8C8C),
          selectedFontSize: 11,
          unselectedFontSize: 11,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() => _selectedIndex = index);
            _animationController.reset();
            _animationController.forward();
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 24),
              activeIcon: Icon(Icons.home, size: 24),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset_outlined, size: 24),
              activeIcon: Icon(Icons.videogame_asset, size: 24),
              label: 'Games',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline, size: 24),
              activeIcon: Icon(Icons.add_circle, size: 24),
              label: 'New & Hot',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download_outlined, size: 24),
              activeIcon: Icon(Icons.download, size: 24),
              label: 'Downloads',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_outlined, size: 24),
              activeIcon: Icon(Icons.menu, size: 24),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen(scrollController: _scrollController);
      case 1:
        return const GamesScreen();
      case 2:
        return const NewScreen();
      case 3:
        return const DownloadsScreen();
      case 4:
        return const MoreScreen();
      default:
        return HomeScreen(scrollController: _scrollController);
    }
  }
}

// Animation Widgets
class ScaleAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;

  const ScaleAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.delay = Duration.zero,
  });

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}

class SlideUpAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const SlideUpAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<SlideUpAnimation> createState() => _SlideUpAnimationState();
}

class _SlideUpAnimationState extends State<SlideUpAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }
}

class FadeInAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;

  const FadeInAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 600),
    this.delay = Duration.zero,
  });

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: widget.child,
    );
  }
}

class BounceAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const BounceAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<BounceAnimation> createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _bounceAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _bounceAnimation,
      child: widget.child,
    );
  }
}

// SlideAnimation widget
class SlideAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;

  const SlideAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
  });

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _controller,
        child: widget.child,
      ),
    );
  }
}

// Updated CategoriesScreen with animations
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildCategoryCard('Action', Icons.favorite, context),
          _buildCategoryCard('Comedy', Icons.sentiment_very_satisfied, context),
          _buildCategoryCard('Drama', Icons.theaters, context),
          _buildCategoryCard('Sci-Fi', Icons.rocket_launch, context),
          _buildCategoryCard('Horror', Icons.whatshot, context),
          _buildCategoryCard('Documentary', Icons.description, context),
          _buildCategoryCard('Romance', Icons.favorite_border, context),
          _buildCategoryCard('Animation', Icons.animation, context),
          _buildCategoryCard('Games', Icons.videogame_asset, context),
          _buildCategoryCard('Studies', Icons.school, context),
          _buildCategoryCard('Fitness', Icons.fitness_center, context),
          _buildCategoryCard('Recipes', Icons.restaurant, context),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, BuildContext context) {
    return BounceAnimation(
      child: Card(
        color: Colors.grey[900],
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryDetailScreen(category: title),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: const Color(0xFFE50914)),
              const SizedBox(height: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Updated HomeScreen with animations
class HomeScreen extends StatelessWidget {
  final ScrollController scrollController;
  const HomeScreen({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const HeroBanner(),
              const SizedBox(height: 30),
              FadeInAnimation(
                delay: const Duration(milliseconds: 200),
                child: MovieSection(
                  title: 'Trending Now',
                  movies: trendingMovies,
                  isLarge: true,
                ),
              ),
              const SizedBox(height: 35),
              FadeInAnimation(
                delay: const Duration(milliseconds: 400),
                child: MovieSection(
                    title: 'Tejs App Originals', movies: tejsOriginals),
              ),
              const SizedBox(height: 35),
              FadeInAnimation(
                delay: const Duration(milliseconds: 600),
                child: MovieSection(
                  title: 'Continue Watching',
                  movies: continueWatching,
                ),
              ),
              const SizedBox(height: 35),
              FadeInAnimation(
                delay: const Duration(milliseconds: 800),
                child:
                    MovieSection(title: 'Recommended for You', movies: forYou),
              ),
              const SizedBox(height: 35),
              FadeInAnimation(
                delay: const Duration(milliseconds: 1000),
                child: MovieSection(
                    title: 'Action & Adventure', movies: actionMovies),
              ),
              const SizedBox(height: 35),
              FadeInAnimation(
                delay: const Duration(milliseconds: 1200),
                child:
                    MovieSection(title: 'Comedy Movies', movies: comedyMovies),
              ),
              const SizedBox(height: 35),
              FadeInAnimation(
                delay: const Duration(milliseconds: 1400),
                child:
                    MovieSection(title: 'Popular Games', movies: gamesContent),
              ),
              const SizedBox(height: 35),
              FadeInAnimation(
                delay: const Duration(milliseconds: 1600),
                child: MovieSection(
                    title: 'Educational Content', movies: studiesContent),
              ),
              const SizedBox(height: 35),
              FadeInAnimation(
                delay: const Duration(milliseconds: 1800),
                child: MovieSection(
                    title: 'Fitness & Health', movies: fitnessContent),
              ),
              const SizedBox(height: 35),
              FadeInAnimation(
                delay: const Duration(milliseconds: 2000),
                child: MovieSection(
                    title: 'Cooking & Recipes', movies: recipesContent),
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ],
    );
  }
}

// Updated HeroBanner with animations
class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF141414),
            Colors.transparent,
            Color(0x66000000),
            Color(0xCC141414),
          ],
          stops: [0.0, 0.3, 0.8, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  Colors.grey[850]!,
                  Colors.grey[900]!,
                  const Color(0xFF141414),
                ],
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.movie_creation_outlined,
                size: 120,
                color: Color(0xFF404040),
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            child: FadeInAnimation(
              delay: const Duration(milliseconds: 300),
              child: const Text(
                'TEJS APP',
                style: TextStyle(
                  color: Color(0xFFE50914),
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  letterSpacing: 3.0,
                ),
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: FadeInAnimation(
              delay: const Duration(milliseconds: 500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTopNavButton('TV Shows', onTap: () {}),
                  const SizedBox(width: 30),
                  _buildTopNavButton('Movies', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MoviesScreen(),
                      ),
                    );
                  }),
                  const SizedBox(width: 30),
                  _buildTopNavButton('Categories', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CategoriesScreen(),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 0,
            right: 0,
            child: FadeInAnimation(
              delay: const Duration(milliseconds: 700),
              child: Column(
                children: [
                  const Text(
                    'Rating & Reviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.0,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          blurRadius: 8,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  ScaleAnimation(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Thriller • Sci-Fi • Horror',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleAnimation(
                        delay: const Duration(milliseconds: 900),
                        child: Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'My List',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 40),
                      ScaleAnimation(
                        delay: const Duration(milliseconds: 1000),
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              bool isConnected = await _checkConnectivity();
                              if (!isConnected) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'No internet connection. Please check your network.'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoPlayerScreen(
                                    videoUrl:
                                        'https://www.youtube.com/watch?v=b9EkMc79ZSU',
                                    title: 'Stranger Things',
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 2,
                            ),
                            icon: const Icon(Icons.play_arrow, size: 28),
                            label: const Text(
                              'Play',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40),
                      ScaleAnimation(
                        delay: const Duration(milliseconds: 1100),
                        child: Column(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RatingReviewsScreen(
                                        movie: Movie(
                                          title: 'Stranger Things',
                                          imageUrl:
                                              'assets/images/stranger.jpg',
                                          genre: 'Sci-Fi',
                                          rating: 8.7,
                                          videoUrl:
                                              'https://www.youtube.com/watch?v=b9EkMc79ZSU',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.info_outline,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Info',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopNavButton(String text, {required VoidCallback onTap}) {
    return ScaleAnimation(
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// Updated MovieSection with animations
class MovieSection extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final bool isLarge;

  const MovieSection({
    super.key,
    required this.title,
    required this.movies,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SlideAnimation(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: isLarge ? 250 : 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return SlideAnimation(
                delay: Duration(milliseconds: 200 + (index * 100)),
                child: MovieCard(
                  movie: movies[index],
                  isLarge: isLarge,
                  isFirst: index == 0,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Updated MovieCard with hover animation
class MovieCard extends StatefulWidget {
  final Movie movie;
  final bool isLarge;
  final bool isFirst;

  const MovieCard({
    super.key,
    required this.movie,
    this.isLarge = false,
    this.isFirst = false,
  });

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovering) {
    if (isHovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.isLarge ? 140 : 130;
    double height = widget.isLarge ? 200 : 180;

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTap: () async {
            bool isConnected = await _checkConnectivity();
            if (!isConnected) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'No internet connection. Please check your network.'),
                  backgroundColor: Colors.red,
                ),
              );
              return;
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(
                  videoUrl: widget.movie.videoUrl,
                  title: widget.movie.title,
                ),
              ),
            );
          },
          child: Container(
            width: width,
            margin: EdgeInsets.only(right: 12, left: widget.isFirst ? 0 : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: widget.movie.imageUrl.isNotEmpty
                          ? Image.asset(
                              widget.movie.imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder: (context, error, stackTrace) =>
                                  _buildPlaceholder(),
                            )
                          : _buildPlaceholder(),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.movie.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      widget.movie.rating.toString(),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  widget.movie.genre,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey[800]!, Colors.grey[900]!],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.movie_outlined, color: Color(0xFF666666), size: 40),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.movie.title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// Updated VideoPlayerScreen with animations
class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final String title;

  const VideoPlayerScreen({
    super.key,
    required this.videoUrl,
    required this.title,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with SingleTickerProviderStateMixin {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  bool _hasError = false;
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();

    final videoId =
        YoutubePlayerController.convertUrlToId(widget.videoUrl) ?? '';
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
        enableCaption: false,
        strictRelatedVideos: false,
      ),
    )..loadVideoById(videoId: videoId);

    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    };

    _controller.onExitFullscreen = () {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    };

    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      if (result != ConnectivityResult.none && _hasError) {
        _retryVideoLoading();
      }
    });
  }

  void _retryVideoLoading() {
    final videoId =
        YoutubePlayerController.convertUrlToId(widget.videoUrl) ?? '';
    _controller.loadVideoById(videoId: videoId);
    setState(() {
      _hasError = false;
    });
  }

  @override
  void dispose() {
    _controller.close();
    _connectivitySubscription?.cancel();
    _animationController.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: ScaleAnimation(
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: FadeInAnimation(
          child: Text(
            widget.title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          ScaleAnimation(
            child: IconButton(
              icon: const Icon(Icons.cast, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: _hasError
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 50,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Failed to load video',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    ScaleAnimation(
                      child: ElevatedButton(
                        onPressed: _retryVideoLoading,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE50914),
                        ),
                        child: const Text('Retry'),
                      ),
                    ),
                  ],
                ),
              )
            : YoutubePlayerScaffold(
                controller: _controller,
                builder: (context, player) {
                  return Column(
                    children: [
                      Expanded(
                        child: player,
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}

// Fix for YoutubePlayerController extension
extension YoutubePlayerControllerExtension on YoutubePlayerController {
  set onExitFullscreen(void Function()? onExitFullscreen) {}

  set onEnterFullscreen(void Function()? onEnterFullscreen) {}
}

// Rest of your original screens with animations added

class RatingReviewsScreen extends StatelessWidget {
  final Movie movie;

  const RatingReviewsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FadeInAnimation(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Movie Info
              SlideAnimation(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(movie.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movie.genre,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.yellow, size: 20),
                              const SizedBox(width: 4),
                              Text(
                                movie.rating.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ScaleAnimation(
                              child: ElevatedButton(
                                onPressed: () async {
                                  bool isConnected = await _checkConnectivity();
                                  if (!isConnected) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'No internet connection. Please check your network.'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VideoPlayerScreen(
                                        videoUrl: movie.videoUrl,
                                        title: movie.title,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE50914),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.play_arrow, size: 24),
                                    SizedBox(width: 8),
                                    Text('Play',
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Rating Section
              const SlideAnimation(
                child: Text(
                  'Rate this Movie',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ScaleAnimation(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    return IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star,
                        color: index < 4 ? Colors.yellow : Colors.grey,
                        size: 36,
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 24),

              // Reviews Section
              const SlideAnimation(
                child: Text(
                  'User Reviews',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildReview(
                'Nandini Gara',
                'Amazing series! The storyline is captivating and the characters are well-developed.',
                5,
              ),
              _buildReview(
                'Shabira Begam',
                'Great show but the last season was a bit disappointing.',
                4,
              ),
              _buildReview(
                'Sampath Nandi',
                'One of the best shows I\'ve ever watched. Highly recommended!',
                5,
              ),
              _buildReview(
                'Hari ',
                'The cinematography is stunning and the acting is superb.',
                5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReview(String name, String comment, int rating) {
    return SlideAnimation(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              comment,
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final String category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<Movie> categoryMovies = [];

    // Filter movies by category
    if (category == 'Action') {
      categoryMovies = actionMovies;
    } else if (category == 'Comedy') {
      categoryMovies = comedyMovies;
    } else if (category == 'Games') {
      categoryMovies = gamesContent;
    } else if (category == 'Studies') {
      categoryMovies = studiesContent;
    } else if (category == 'Fitness') {
      categoryMovies = fitnessContent;
    } else if (category == 'Recipes') {
      categoryMovies = recipesContent;
    } else {
      // For other categories, mix movies from different lists
      categoryMovies = [
        ...trendingMovies,
        ...tejsOriginals,
        ...forYou,
      ];
    }

    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        title: Text(category),
      ),
      body: FadeInAnimation(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: categoryMovies.length,
          itemBuilder: (context, index) {
            final movie = categoryMovies[index];
            return SlideAnimation(
              delay: Duration(milliseconds: index * 100),
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(movie.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text(
                  movie.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(movie.genre),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    const SizedBox(width: 4),
                    Text(movie.rating.toString()),
                  ],
                ),
                onTap: () async {
                  bool isConnected = await _checkConnectivity();
                  if (!isConnected) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'No internet connection. Please check your network.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(
                        videoUrl: movie.videoUrl,
                        title: movie.title,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: FadeInAnimation(
        child: ListView(
          children: [
            MovieSection(
              title: 'Popular Movies',
              movies: trendingMovies,
              isLarge: false,
            ),
            MovieSection(
              title: 'New Releases',
              movies: tejsOriginals,
              isLarge: false,
            ),
            MovieSection(
              title: 'Action Movies',
              movies: actionMovies,
              isLarge: false,
            ),
            MovieSection(
              title: 'Comedy Movies',
              movies: comedyMovies,
              isLarge: false,
            ),
          ],
        ),
      ),
    );
  }
}

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        title: const Text('Games'),
        backgroundColor: const Color(0xFF141414),
      ),
      body: FadeInAnimation(
        child: GridView.count(
          padding: const EdgeInsets.all(12),
          crossAxisCount: 2,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: 0.8,
          children: [
            _buildGameCard('Tic Tac Toe', Icons.grid_3x3, context, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TicTacToeGame()),
              );
            }),
            _buildGameCard('Nuts & Bolts', Icons.build, context, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NutsAndBoltsPuzzle(),
                ),
              );
            }),
            _buildGameCard('Funny Quiz 😂', Icons.quiz, context, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FunnyQuizGame(),
                ),
              );
            }),
            _buildGameCard('Coming Soon 🚀', Icons.lock, context, () {
              _showNotAvailableSnackbar(context, "This game");
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildGameCard(
      String title, IconData icon, BuildContext context, VoidCallback onTap) {
    return BounceAnimation(
      child: Card(
        color: Colors.grey[800],
        margin: const EdgeInsets.all(4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    color: Colors.grey[900],
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNotAvailableSnackbar(BuildContext context, String gameName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$gameName is not available yet'),
        backgroundColor: const Color(0xFFE50914),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        title: const Text('New & Hot'),
      ),
      body: FadeInAnimation(
        child: ListView(
          children: [
            // Coming Soon Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Coming Soon',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: upcomingMovies.length,
                itemBuilder: (context, index) {
                  final movie = upcomingMovies[index];
                  return SlideAnimation(
                    delay: Duration(milliseconds: index * 100),
                    child: Container(
                      width: 140,
                      margin:
                          EdgeInsets.only(right: 16, left: index == 0 ? 0 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[800],
                                image: movie.imageUrl.isNotEmpty
                                    ? DecorationImage(
                                        image: AssetImage(movie.imageUrl),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: movie.imageUrl.isEmpty
                                  ? const Center(
                                      child: Icon(Icons.movie,
                                          color: Colors.white70, size: 40),
                                    )
                                  : Stack(
                                      children: [
                                        Positioned(
                                          bottom: 8,
                                          right: 8,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              'Coming ${(index + 1) * 7} Dec',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movie.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            movie.genre,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Popular Now Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Popular Now',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: trendingMovies.length,
                itemBuilder: (context, index) {
                  final movie = trendingMovies[index];
                  return SlideAnimation(
                    delay: Duration(milliseconds: index * 100),
                    child: Container(
                      width: 120,
                      margin:
                          EdgeInsets.only(right: 12, left: index == 0 ? 0 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(movie.imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            movie.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.yellow, size: 14),
                              const SizedBox(width: 4),
                              Text(
                                movie.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Top 10 Today Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Top 10 Today',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  final movie = trendingMovies[index % trendingMovies.length];
                  return SlideAnimation(
                    delay: Duration(milliseconds: index * 100),
                    child: Container(
                      width: 140,
                      margin:
                          EdgeInsets.only(right: 16, left: index == 0 ? 0 : 0),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: AssetImage(movie.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.yellow, size: 14),
                                  const SizedBox(width: 4),
                                  Text(
                                    movie.rating.toString(),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            top: -5,
                            left: -5,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Color(0xFFE50914),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        title: const Text('Downloads'),
      ),
      body: FadeInAnimation(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Your Downloads',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildDownloadItem(
                'Stranger Things', 'S4 E5: The Nina Project', '2.4 GB', '85%'),
            _buildDownloadItem(
                'The Witcher', 'S2 E3: What Is Lost', '1.8 GB', '100%'),
            _buildDownloadItem(
                'Money Heist', 'S5 E1: The Final Chapter', '2.1 GB', '100%'),
            _buildDownloadItem('Squid Game', 'S1 E6: Gganbu', '1.9 GB', '100%'),
            const SizedBox(height: 24),
            const Text(
              'Available for Download',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: downloadableMovies.length,
                itemBuilder: (context, index) {
                  return SlideAnimation(
                    delay: Duration(milliseconds: index * 100),
                    child: Container(
                      width: 120,
                      margin:
                          EdgeInsets.only(right: 12, left: index == 0 ? 0 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: AssetImage(
                                      downloadableMovies[index].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: const Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child:
                                      Icon(Icons.download, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            downloadableMovies[index].title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDownloadItem(
      String title, String episode, String size, String progress) {
    return SlideAnimation(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: const DecorationImage(
                  image: AssetImage('assets/images/stranger.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    episode,
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress == '100%' ? 1.0 : 0.85,
                    backgroundColor: Colors.grey[800],
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xFFE50914)),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        size,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        progress,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      appBar: AppBar(
        title: const Text('More'),
      ),
      body: FadeInAnimation(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildProfileSection(),
            const SizedBox(height: 24),
            _buildSettingsItem(Icons.account_circle, 'Account'),
            _buildSettingsItem(Icons.notifications, 'Notifications'),
            _buildSettingsItem(Icons.lock, 'Privacy & Security'),
            _buildSettingsItem(Icons.language, 'Language'),
            _buildSettingsItem(Icons.help, 'Help & Support'),
            _buildSettingsItem(Icons.info, 'About'),
            const SizedBox(height: 24),
            _buildSignOutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return SlideAnimation(
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE50914), Color(0xFFB20710)],
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Icon(Icons.person, size: 40, color: Colors.white),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tejaswiniprakash Yerra',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Premium Member',
                style: TextStyle(
                  color: Color(0xFFE50914),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(IconData icon, String title) {
    return SlideAnimation(
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {},
      ),
    );
  }

  Widget _buildSignOutButton() {
    return ScaleAnimation(
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[800],
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}
