import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/apis_utils.dart';
import 'package:movie_app/features/movie/domain/entities/entities.dart';

class DetailsPage extends StatelessWidget {
  final MovieDetailsEntity movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .55,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: movie.id,
                  child: CachedNetworkImage(
                    imageUrl: API.REQUEST_IMG(movie.posterPath),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                movie.overview,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.new_releases),
                  Text(movie.releaseDate),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
