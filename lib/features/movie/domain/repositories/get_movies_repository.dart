import 'package:dartz/dartz.dart';
import 'package:movie_app/features/movie/domain/entities/entities.dart';

abstract class GetMoviesRepository {
  Future<Either<Exception, MovieEntity>> call();
}
