import 'package:bloc_clean/model/movie_model/movies_model.dart';
import 'package:bloc_clean/repository/movie/movies_repository.dart';

class MoviesMockApiRespository implements MoviesRepository {
  @override
  Future<MoviesModel> fetchMoviesList() {
    // TODO: implement fetchMoviesList
    throw UnimplementedError();
  }
}
