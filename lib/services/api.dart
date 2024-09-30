import 'dart:async';
import 'dart:convert';
import 'dart:io'; 
import 'package:http/http.dart' as http;

class TMDBService {
  final String apiKey = 'bc6f84d64dbbab4a399cbc13775b8e54';
  final String baseUrl = 'https://api.themoviedb.org/3';
  final int retryLimit = 10;

  Future<dynamic> _get(String path) async {
    final uri = Uri.parse('$baseUrl$path?api_key=$apiKey');
    int attempt = 0;

    while (attempt < retryLimit) {
      try {
        final response = await http
            .get(uri)
            .timeout(const Duration(seconds: 10));
        switch (response.statusCode) {
          case 200:
            return json.decode(response.body);
          case 400:
            throw Exception('Bad Request: Invalid syntax.');
          case 401:
            throw Exception('Unauthorized: Authentication required.');
          case 403:
            throw Exception('Forbidden: Access denied.');
          case 404:
            throw Exception('Not Found: Resource not found.');
          case 500:
            throw Exception('Internal Server Error: Server issue.');
          case 502:
            throw Exception('Bad Gateway: Invalid response from upstream server.');
          case 503:
            throw Exception('Service Unavailable: Server is down.');
          case 504:
            throw Exception('Gateway Timeout: No response in time.');
          default:
            throw Exception('Failed to load data: ${response.statusCode}');
        }
      } on SocketException catch (e) {
        attempt++;
        if (attempt >= retryLimit) {
          throw Exception('Network error after $retryLimit attempts: $e');
        }
      } on TimeoutException {
        attempt++;
        if (attempt >= retryLimit) {
          throw Exception('Request timed out after $retryLimit attempts.');
        }
      } on http.ClientException catch (e) {
        throw Exception('Network error: $e');
      }
    }
  }

  Future<List<dynamic>> fetcPopularMovies() async {
    final data = await _get('/movie/popular');
    return data['results'];
  }

  Future<List<dynamic>> fetchUpcomingMovies() async {
    final data = await _get('/movie/upcoming');
    return data['results'];
  }

  Future<List<dynamic>> fetchNowPlayingMovies() async {
    final data = await _get('/movie/now_playing');
    return data['results'];
  }

  Future<List<dynamic>> fetchTopRated() async {
    final data = await _get('/movie/top_rated');
    return data['results'];
  }

  Future<List<dynamic>> tvShows() async {
    final data = await _get('/tv/airing_today');
    return data['results'];
  }

  Future<Map<String, dynamic>> fetchMovieDetails(int movieId) async {
    return await _get('/movie/$movieId');
  }
}
