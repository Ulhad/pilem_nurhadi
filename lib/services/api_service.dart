import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = '2236529162f2d8a59cb27420a45568fc';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Map<String, dynamic>>> getAllMovies() async {
    final response = await http.get(
        Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey'));
    final data = jsonDecode(response.body);
    return List<Map<String, dynamic>>.from(data['result']);
  }

  Future<List<Map<String, dynamic>>> getTrendingMovies() async {
    final response = await http.get(
        Uri.parse('$baseUrl/movie/week?api_key=$apiKey'));
    final data = jsonDecode(response.body);
    return List<Map<String, dynamic>>.from(data['result']);
  }
  Future<List<Map<String, dynamic>>> getPopularMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    final data = jsonDecode(response.body);
    return List<Map<String, dynamic>>.from(data['result']);
}
}
