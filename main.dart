import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/text.dart';
import 'package:flutter_application_1/widgets/trending.dart';

void main() => runApp(new moviesApp());

class moviesApp extends StatelessWidget {
  const moviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.green),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = 'd5ca80e684c62b53d874632ad755784b';
  final readaccesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNWNhODBlNjg0YzYyYjUzZDg3NDYzMmFkNzU1Nzg0YiIsInN1YiI6IjYxMTg4ZGIwMTUxYzVjMDA1YzZiZWJjYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9MU2oAk4wxb3-uXk2g0EL8tVcj8663GcOLIYFLJ_ER8';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readaccesstoken),
        logConfig: ConfigLogger(
            showLogs: true, showErrorLogs: true)); // ConfigLogger, TMDB
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: modified_text(text: 'Movies App'),
      ),
      body: ListView(
        children: [TrendingMovies(trending: trendingmovies)],
      ),
    );
  }
}
