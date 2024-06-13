import '../../model/movie_model/movies_model.dart';

abstract class MoviesRepository {
  Future<MoviesModel> fetchMoviesList();
}
