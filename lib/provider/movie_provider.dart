import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';

import '../repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier {
  final MovieRepository _movieRepository = MovieRepository();
  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  loadMovies() async {
    List<MovieModel> listMovies = await _movieRepository.loadMovies();
    _movies = listMovies;
    notifyListeners();
  }
}
