import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotstar1/pages/new&hot/detail_show.dart';
import 'package:hotstar1/pages/new&hot/reminder_box.dart';
import 'package:hotstar1/services/api.dart';
import 'package:hotstar1/services/model_movies.dart';
import 'package:readmore/readmore.dart';


class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  final TMDBService _tmdbService = TMDBService();
  late Future<List<Movie>> _listSet;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _listSet = listSetMovie();
  }

  Future<List<Movie>> listSetMovie() async {
    final results = await _tmdbService.fetchNowPlayingMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              child: FutureBuilder(
                future: _listSet,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error"),
                    );
                  } else {
                    final listmovies = snapshot.data!;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final listmovie = listmovies[index];
                        return Column(
                          children: [
                            SizedBox(
                              height: 200,
                              width: screenWidth,
                              child: ClipRect(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w500${listmovie.posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 100,
                              width: screenWidth,
                              decoration:
                                  const BoxDecoration(color: Colors.black),
                              child: Center(
                                child: Text(
                                  listmovie.title,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 30,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Releasing on ${listmovie.releasedate}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            detailsrow(details: listmovie),
                            const SizedBox(
                              height: 10,
                            ),
                            ReadMoreText(
                              listmovie.overview,
                              trimLength: 47,
                              trimCollapsedText: "See more",
                              trimExpandedText: 'See less',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            remindmebox(releasedate: listmovie.releasedate),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                      itemCount: listmovies.length,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}