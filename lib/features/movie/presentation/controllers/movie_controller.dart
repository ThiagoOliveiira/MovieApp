import 'package:flutter/material.dart';
import 'package:movie_app/features/movie/domain/entities/entities.dart';
import 'package:movie_app/features/movie/domain/usecases/usecases.dart';

import '../dtos/movie_dto.dart';

class MovieController {
  final GetMoviesUseCase _getMoviesUseCase;
  MovieController(this._getMoviesUseCase) {
    fetch();
  }

  ValueNotifier<MovieEntity?> movies = ValueNotifier<MovieEntity?>(null);
  MovieEntity? _cachedMovies;

  onChanged(String value) {
    List<MovieDetailsEntity> list = _cachedMovies!.listMovies
        .where(
          (e) => e.toString().toLowerCase().contains((value.toLowerCase())),
        )
        .toList();
    movies.value = movies.value!.copyWith(listMovies: list);
  }

  fetch() async {
    var result = await _getMoviesUseCase();

    result.fold(
      (error) => debugPrint(error.toString()),
      (sucess) => movies.value = sucess,
    );

    _cachedMovies = movies.value;
  }
}
