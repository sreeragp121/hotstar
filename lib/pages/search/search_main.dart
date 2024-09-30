import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotstar1/pages/search/category.dart';
import 'package:hotstar1/pages/search/grid_view.dart';
import 'package:hotstar1/services/api.dart';
import 'package:hotstar1/services/model_movies.dart';

class MySearch extends StatefulWidget {
  const MySearch({super.key});

  @override
  State<MySearch> createState() => _MySearchState();
}

class _MySearchState extends State<MySearch> {
  final TMDBService _tmdbService = TMDBService();
  late Future<List<Movie>> _carouselMovies;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  Timer? _debouncer;
  bool searchvisibility = false;
  @override
  void initState() {
    _carouselMovies = fetchMovies();
    super.initState();
  }

  Future<List<Movie>> fetchMovies() async {
    final results = await _tmdbService.fetcPopularMovies();
    return results.map((movie) => Movie.fromJson(movie)).toList();
  }

  List<Movie> _filterdMoies(List<Movie> movies){
    return movies.where((movie){
      final title=movie.title.toLowerCase();
      final searchQuery =_searchQuery.toLowerCase();
      return title.contains(searchQuery);
    }).toList();
  }

  void _onSearchChange(String query){
    if(_debouncer?.isActive??false) _debouncer!.cancel();
    _debouncer=Timer(const Duration(milliseconds: 500), (){
      setState(() {
        _searchQuery=query;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List<Movie>>(
        future: _carouselMovies,
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                            // controller: _searchController,
                            onTap: () {
                              setState(() {
                                searchvisibility = true;
                              });
                            },
                            onChanged:_onSearchChange,

                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: 'Movies, shows and more',
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                      size: 25,
                                    )),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        searchvisibility = false;
                                        _searchController.clear();
                                        FocusScope.of(context).unfocus();
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.mic_none,
                                      size: 25,
                                    )),
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))))),
                      )),
                  const SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: HorizontalViewItems()),
                  GridViews(movies: _filterdMoies(movies)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
