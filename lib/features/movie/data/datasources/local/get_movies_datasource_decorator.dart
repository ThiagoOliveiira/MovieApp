import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/data/datasources/datasources.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

class GetMoviesDataSourceDecorator implements GetMoviesDataSource {
  final GetMoviesDataSource _getMoviesDataSource;
  GetMoviesDataSourceDecorator(this._getMoviesDataSource);

  @override
  Future<Either<Exception, MovieEntity>> call() => _getMoviesDataSource();
}
