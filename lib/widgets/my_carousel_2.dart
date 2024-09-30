import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotstar1/services/model_movies.dart';

class MyCarouselSmall extends StatefulWidget {
  final Future<List<Movie>> imageList;
  const MyCarouselSmall({super.key, required this.imageList});

  @override
  State<MyCarouselSmall> createState() => _MyCarouselSmallState();
}

class _MyCarouselSmallState extends State<MyCarouselSmall> {

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
          final movies = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CarouselSlider.builder(
              itemCount: movies.length,
              options: CarouselOptions(
                aspectRatio: 2.4,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Easing.legacy,
                pauseAutoPlayOnTouch: true,
                viewportFraction: 0.99,
              ),
              itemBuilder: (context, index, realIndex) {
                final movie = movies[index];
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${movie.background}'),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
