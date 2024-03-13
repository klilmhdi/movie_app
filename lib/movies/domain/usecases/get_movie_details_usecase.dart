import 'package:movie_app/core/data/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/domain/entities/media_details.dart';
import 'package:movie_app/core/domain/usecase/base_use_case.dart';
import 'package:movie_app/movies/domain/repository/movies_repository.dart';

class GetMoviesDetailsUseCase extends BaseUseCase<MediaDetails, int> {
  final MoviesRespository _baseMoviesRespository;

  GetMoviesDetailsUseCase(this._baseMoviesRespository);

  @override
  Future<Either<Failure, MediaDetails>> call(int p) async {
    return await _baseMoviesRespository.getMovieDetails(p);
  }
}
