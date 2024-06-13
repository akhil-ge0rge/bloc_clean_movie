import 'package:bloc_clean/config/app_url.dart';
import 'package:bloc_clean/data/network/network_services_api.dart';
import 'package:bloc_clean/model/movie_model/movies_model.dart';
import 'package:bloc_clean/repository/movie/movies_repository.dart';

class MoviesHttpApiRepositoryImpl implements MoviesRepository {
  final _apiServices = NetworkServicesApi();
  @override
  Future<MoviesModel> fetchMoviesList() async {
    final response = await _apiServices.getApi(AppUrl.popularMoviesApi);
    return MoviesModel.fromJson(response);
  }
}
