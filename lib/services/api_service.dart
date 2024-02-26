import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = 'YOUR_API_KEY';
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
