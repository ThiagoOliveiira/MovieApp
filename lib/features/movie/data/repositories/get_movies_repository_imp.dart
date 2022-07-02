import 'package:movie_app/features/movie/data/datasources/datasources.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_app/features/movie/domain/repositories/repositories.dart';

import 'package:dartz/dartz.dart';

class GetMoviesRespositoryImp implements GetMoviesRepository {
  final GetMoviesDataSource _getMoviesDataSource;

  const GetMoviesRespositoryImp(this._getMoviesDataSource);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    return await _getMoviesDataSource();
  }
}
