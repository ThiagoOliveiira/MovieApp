import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/domain/entities/entities.dart';

abstract class GetMoviesDataSource {
  Future<Either<Exception, MovieEntity>> call();
}
