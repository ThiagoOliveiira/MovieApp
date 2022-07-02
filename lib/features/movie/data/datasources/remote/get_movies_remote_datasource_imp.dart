import 'package:dartz/dartz.dart';
import 'package:movie_app/core/domain/services/services.dart';
import 'package:movie_app/core/utils/apis_utils.dart';
import 'package:movie_app/features/movie/data/datasources/datasources.dart';
import 'package:movie_app/features/movie/data/dtos/movie_dto.dart';
import 'package:movie_app/features/movie/domain/entities/movie_entity.dart';

class GetMoviesRemoteDataSourceImp implements GetMoviesDataSource {
  final HttpService _httpService;

  GetMoviesRemoteDataSourceImp(this._httpService);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      var result = await _httpService.get(API.REQUEST_MOVIE_LIST);
      return Right(MovieDto.fromJson(result.data));
    } catch (e) {
      return Left(Exception('Falha no datasource'));
    }
  }
}
