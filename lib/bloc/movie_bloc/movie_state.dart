// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_bloc.dart';

class MovieState extends Equatable {
  final ApiResponse<MoviesModel> movieList;

  const MovieState({required this.movieList});

  MovieState copyWith({ApiResponse<MoviesModel>? movieList}) {
    return MovieState(movieList: movieList ?? this.movieList);
  }

  @override
  List<Object?> get props => [movieList];
}
