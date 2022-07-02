import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/data/datasources/get_movies_datasource.dart';
import 'package:movie_app/features/movie/data/dtos/dtos.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/entities.dart';
import 'get_movies_datasource_decorator.dart';

class GetMoviesLocaDataSourceDecoratorImp extends GetMoviesDataSourceDecorator {
  GetMoviesLocaDataSourceDecoratorImp(GetMoviesDataSource getMoviesDataSource)
      : super(getMoviesDataSource);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    return (await super()).fold(
      (error) async => Right(await _getInCache()),
      (result) {
        _saveInCache(result);
        return Right(result);
      },
    );
  }

  _saveInCache(MovieEntity movies) async {
    var prefs = await SharedPreferences.getInstance();
    String jsonMovies = jsonEncode(movies.toJson());
    prefs.setString('movies_cache', jsonMovies);
    print('salvou no cache ');
  }

  Future<MovieEntity> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();
    var moviesJsonString = prefs.getString('movies_cache')!;
    var json = jsonDecode(moviesJsonString);
    var movies = MovieDto.fromJson(json);
    print('recuperou do cache os filmes ' + movies.toString());
    return movies;
  }
}
