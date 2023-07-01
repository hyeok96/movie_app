import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/movie_model.dart';
import '../../provider/movie_provider.dart';

class MovieList extends StatelessWidget {
  MovieList({super.key});
  late MovieProvider _movieProvider;

  Widget _makeMovieOne(MovieModel movie) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: Image.network(movie.posterurl),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    movie.overview,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                    style: const TextStyle(
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _makeListView(List<MovieModel> movies) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset: const Offset(0, 0)),
                  ]),
              height: 200,
              child: _makeMovieOne(movies[index]),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
        itemCount: movies.length);
  }

  @override
  Widget build(BuildContext context) {
    _movieProvider = Provider.of<MovieProvider>(context, listen: false);
    _movieProvider.loadMovies();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Moive App"),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if (provider.movies.isNotEmpty) {
            return _makeListView(provider.movies);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
