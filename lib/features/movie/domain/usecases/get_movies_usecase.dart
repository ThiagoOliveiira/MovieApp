import 'package:movie_app/features/movie/domain/entities/entities.dart';

abstract class GetMoviesUseCase {
  Future<MovieEntity> call();
}
