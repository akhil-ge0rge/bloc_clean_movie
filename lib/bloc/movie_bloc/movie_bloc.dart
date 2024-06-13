import 'dart:developer';

import 'package:bloc_clean/data/api_response.dart';
import 'package:bloc_clean/repository/movie/movies_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/movie_model/movies_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MoviesRepository moviesRepository;
  MovieBloc({required this.moviesRepository})
      : super(MovieState(movieList: ApiResponse.loading())) {
    on<FetchMoviesEvent>(_fetchMovies);
  }

  void _fetchMovies(FetchMoviesEvent event, Emitter<MovieState> emit) async {
    await moviesRepository.fetchMoviesList().then(
      (value) {
        emit(state.copyWith(movieList: ApiResponse.completed(value)));
      },
    ).onError(
      (error, stackTrace) {
        log(error.toString());
        emit(state.copyWith(movieList: ApiResponse.error(error.toString())));
      },
    );
  }
}
