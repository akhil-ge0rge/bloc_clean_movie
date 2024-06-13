import 'dart:developer';

import 'package:bloc_clean/bloc/movie_bloc/movie_bloc.dart';
import 'package:bloc_clean/config/components/internet_exception_widget.dart';
import 'package:bloc_clean/config/routes/route_name.dart';
import 'package:bloc_clean/main.dart';
import 'package:bloc_clean/services/storage/local_storage.dart';
import 'package:bloc_clean/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieBloc _movieBloc;
  @override
  void initState() {
    _movieBloc = MovieBloc(moviesRepository: getIt());
    super.initState();
  }

  @override
  void dispose() {
    _movieBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                LocalStorage localStorage = LocalStorage();
                localStorage.clearValue(key: 'token').then(
                  (value) {
                    localStorage.clearValue(key: 'isLogin');
                    Navigator.of(context)
                        .pushReplacementNamed(RouteName.loginScreen);
                  },
                );
              },
              icon: const Icon(Icons.logout)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => _movieBloc..add(FetchMoviesEvent()),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            switch (state.movieList.status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              case Status.error:
                if (state.movieList.message!.trim() ==
                    'No Internet Connection') {
                  log(1.toString());
                  return InternetExceptionWidget(onPress: () {
                    _movieBloc.add(FetchMoviesEvent());
                  });
                } else {
                  log(2.toString());

                  return Center(
                    child: Text(state.movieList.message.toString()),
                  );
                }

              case Status.completed:
                if (state.movieList.data == null) {
                  return const Center(
                    child: Text("Data not found"),
                  );
                } else {
                  final movieList = state.movieList.data!;
                  return ListView.builder(
                    itemCount: movieList.tvShows.length,
                    itemBuilder: (context, index) {
                      final tvShow = movieList.tvShows.elementAt(index);
                      return Card(
                        child: ListTile(
                          leading: Image.network(tvShow.imageThumbnailPath),
                          title: Text(tvShow.name),
                          subtitle: Text(tvShow.network),
                          trailing: Text(tvShow.status),
                        ),
                      );
                    },
                  );
                }

              default:
                return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
