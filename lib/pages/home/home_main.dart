import 'package:flutter/material.dart';
import 'package:hotstar1/services/api.dart';
import 'package:hotstar1/services/model_movies.dart';
import 'package:hotstar1/services/model_tv_shows.dart';
import 'package:hotstar1/widgets/my_carousel_1.dart';
import 'package:hotstar1/widgets/my_carousel_2.dart';
import 'package:hotstar1/widgets/my_list_view_with_number.dart';
import 'package:hotstar1/widgets/my_listview_builder.dart';

class MyHomeMain extends StatefulWidget {
  const MyHomeMain({super.key});

  @override
  State<MyHomeMain> createState() => _MyHomeMainState();
}

class _MyHomeMainState extends State<MyHomeMain> {
  List trendingMovies = [];
  final TMDBService _tmdbService = TMDBService();
  late Future<List<Movie>> _carouselMovies;
  late Future<List<Movie>> _latestReleses;
  late Future<List<ModelTv>> _tvEpisodes;
  late Future<List<Movie>> _topRated;
  late Future<List<Movie>> _nowPlaying;

  @override
  void initState() {
    super.initState();
    _carouselMovies = fetchMovies();
    _latestReleses = fetchUpcomingMovies();
    _tvEpisodes = fetchTvEpisodes();
    _topRated = fetchTopRated();
    _nowPlaying = fetchNowPlayings();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            MyCarouselBig(
              moviesFuture: _carouselMovies,
            ),
            MyListViewBuilder(
              word1: '',
              word2: 'Latest Releases',
              imageList: _latestReleses,
              textValue: 'Play Now',
            ),
            MyCarouselSmall(
              imageList: _latestReleses,
            ),
            MyListViewBuilder(
              word1: 'Free',
              word2: ' Newly Added',
              imageList: _topRated,
            ),
            MyListViewWithNumber(
              word1: 'Top 10 ',
              word2: 'in India Today',
              imageList: _tvEpisodes,
            ),
            MyListViewBuilder(
              word1: '',
              word2: 'Popular Shows',
              imageList: _nowPlaying,
            ),
            MyCarouselSmall(
              imageList: _nowPlaying,
            ),
            MyListViewBuilder(
              word1: 'Watch',
              word2: ' With Your Family',
              imageList: _latestReleses,
              textValue: 'Free',
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Movie>> fetchMovies() async {
    final results = await _tmdbService.fetcPopularMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> fetchUpcomingMovies() async {
    final results = await _tmdbService.fetchUpcomingMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<ModelTv>> fetchTvEpisodes() async {
    final results = await _tmdbService.tvShows();
    return results.map((tv) => ModelTv.fromJson(tv)).toList();
  }

  Future<List<Movie>> fetchTopRated() async {
    final results = await _tmdbService.fetchTopRated();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  Future<List<Movie>> fetchNowPlayings() async {
    final results = await _tmdbService.fetchNowPlayingMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }
}
