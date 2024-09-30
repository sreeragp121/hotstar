import 'package:flutter/material.dart';
import 'package:hotstar1/services/model_movies.dart';

class MyListViewBuilder extends StatefulWidget {
  final String? word1;
  final String? word2;
  final Future<List<Movie>> imageList;
  final String? textValue;
  const MyListViewBuilder(
      {super.key,
      required this.word1,
      required this.word2,
      required this.imageList,
      this.textValue});

  @override
  State<MyListViewBuilder> createState() => _MyListViewBuilderState();
}

class _MyListViewBuilderState extends State<MyListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
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
          final movies = snapshot.data!;
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
                aspectRatio: 2.7,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final movie = movies[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 2,
                            top: 2,
                            child: (widget.textValue != null)
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 1,horizontal: 4),
                                      child: Text(
                                        widget.textValue!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: movies.length,
                ),
              )
            ],
          );
        }
      },
    );
  }
}
