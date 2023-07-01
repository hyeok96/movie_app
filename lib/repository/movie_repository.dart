import 'package:dio/dio.dart';
import 'package:movie_app/model/movie_model.dart';

class MovieRepository {
  Future<List<MovieModel>> loadMovies() async {
    var dio = Dio();
    var respones = await dio.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=4d0f2b563e6f8fceb3c1cd4563306a20");

    if (respones.data != null) {
      Map<String, dynamic> body = respones.data;
      if (body["results"] != null) {
        List<dynamic> list = body["results"];
        return list.map<MovieModel>((e) => MovieModel.fromJson(e)).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}
