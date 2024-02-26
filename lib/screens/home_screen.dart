import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Movie> movies;
  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  Future<void> _fetchMovies() async {
    final List<Movie> fetchedMovies = await apiService.fetchMovies();
    setState(() {
      movies = fetchedMovies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: movies == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            title: Text(movie.title),
            subtitle: Text(movie.overview),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(movieId: movie.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
