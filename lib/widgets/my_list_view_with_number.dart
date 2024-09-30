import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hotstar1/services/model_tv_shows.dart';

class MyListViewWithNumber extends StatefulWidget {
  final String? word1;
  final String? word2;
  final Future<List<ModelTv>> imageList;
  const MyListViewWithNumber(
      {super.key, required this.word1,required this.word2, required this.imageList});

  @override
  State<MyListViewWithNumber> createState() => _MyListViewWithNumberState();
}

class _MyListViewWithNumberState extends State<MyListViewWithNumber> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.imageList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error:${snapshot.error}",
              style: const TextStyle(color: Colors.white),
            ),
          );
        } else {
          final tvList=snapshot.data!;
          final int tvShowsCount = min(tvList.length, 10);
          final List<ModelTv> tvShows = tvList.take(tvShowsCount).toList();
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: widget.word1,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                      TextSpan(
                        text: widget.word2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 2.20,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final tvShow = tvShows[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 140,
                            height: 150,
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 110,
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${tvShow.posterPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 255, 255, 255),
                                  Color.fromARGB(255, 169, 173, 173),
                                ],
                              ).createShader(Rect.fromLTWH(
                                  0, 0, bounds.width, bounds.height)),
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: tvShows.length,
                ),
              )
            ],
          );
        }
      },
    );
  }
}
