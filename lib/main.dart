import 'package:bloc_clean/config/routes/route_name.dart';
import 'package:bloc_clean/config/routes/routes.dart';
import 'package:bloc_clean/repository/auth/login_http_api_repository_impl.dart';
import 'package:bloc_clean/repository/auth/login_mock_api_repository_impl.dart';
import 'package:bloc_clean/repository/auth/login_repository.dart';
import 'package:bloc_clean/repository/movie/movies_http_api_repository_impl.dart';
import 'package:bloc_clean/repository/movie/movies_repository.dart';
import 'package:bloc_clean/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginHttpApiRepositoryImpl(),
  );
  getIt.registerLazySingleton<MoviesRepository>(
    () => MoviesHttpApiRepositoryImpl(),
  );
}
