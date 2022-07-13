import 'package:appi/widgets/presntaion/topRated.dart';
import 'package:appi/widgets/presntaion/tv-shows.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'widgets/trendingmovies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(primarySwatch: Colors.green, backgroundColor: Colors.black),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String apikey = 'd4fbdf7c1e4bca5dbc9bf9836ca261a9';
  final String accestoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNGZiZGY3YzFlNGJjYTVkYmM5YmY5ODM2Y2EyNjFhOSIsInN1YiI6IjYyYzUzMTRiYjZjMjY0MDA1OWQyZGRmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Vi6tqNxf0k6zy5oA-b7AFC7cprAi6fWGnbqt6WqLWrM';
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  @override
  void initState() {
    fechMovies();
    super.initState();
  }

  fechMovies() async {
    TMDB tmdbWithCoustomLogs = TMDB(ApiKeys(apikey, accestoken),
        logConfig: const ConfigLogger(showInfoLogs: true, showErrorLogs: true));
    Map trendingResult = await tmdbWithCoustomLogs.v3.trending.getTrending();
    Map topRated = await tmdbWithCoustomLogs.v3.tv.getTopRated();
    Map tvRated = await tmdbWithCoustomLogs.v3.tv.getPopular();
    setState(() {
      trendingMovies = trendingResult["results"];
      topRatedMovies = topRated['results'];
      tv = tvRated['results'];
    });
    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Vedio Player"),
      ),
      body: ListView(
        children: [
          TrendingMovies(
            trending: trendingMovies,
          ),
          TopRated(
            topRated: topRatedMovies,
          ),
          TvShows(tvshow: tv)
        ],
      ),
    );
  }
}
