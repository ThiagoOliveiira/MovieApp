import 'package:get_it/get_it.dart';
import 'package:movie_app/core/data/services/services.dart';
import 'package:movie_app/core/domain/services/services.dart';
import 'package:movie_app/features/movie/data/datasources/get_movies_datasource.dart';
import 'package:movie_app/features/movie/data/datasources/local/get_movies_datasource_decorator_imp.dart';
import 'package:movie_app/features/movie/data/datasources/remote/get_movies_remote_datasource_imp.dart';
import 'package:movie_app/features/movie/data/repositories/respositories.dart';
import 'package:movie_app/features/movie/domain/repositories/repositories.dart';
import 'package:movie_app/features/movie/domain/usecases/usecases.dart';
import 'package:movie_app/features/movie/presentation/controllers/controllers.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;
    // core
    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());

    // datasources
    getIt.registerLazySingleton<GetMoviesDataSource>(() =>
        GetMoviesLocaDataSourceDecoratorImp(
            GetMoviesRemoteDataSourceImp(getIt())));

    // repositories
    getIt.registerLazySingleton<GetMoviesRepository>(
        () => GetMoviesRespositoryImp(getIt()));

    // usecases
    getIt.registerLazySingleton<GetMoviesUseCase>(
        () => GetMoviesUseCaseImp(getIt()));

    // controllers
    getIt
        .registerLazySingleton<MovieController>(() => MovieController(getIt()));
  }
}
