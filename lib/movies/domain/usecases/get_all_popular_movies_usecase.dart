import 'package:movie_app/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/domain/entities/media.dart';
import 'package:movie_app/core/domain/usecase/base_use_case.dart';
import 'package:movie_app/movies/domain/repository/movies_repository.dart';

class GetAllPopularMoviesUseCase extends BaseUseCase<List<Media>, int> {
  final MoviesRespository _baseMoviesRespository;

  GetAllPopularMoviesUseCase(this._baseMoviesRespository);

  @override
  Future<Either<Failure, List<Media>>> call(int p) async {
    return await _baseMoviesRespository.getAllPopularMovies(p);
  }
}
