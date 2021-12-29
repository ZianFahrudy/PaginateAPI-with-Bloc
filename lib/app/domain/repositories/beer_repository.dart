import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pagination_with_bloc/app/data/models/beer_model.dart';
import 'package:pagination_with_bloc/app/data/models/failed_model.dart';

abstract class BeerRepository {
  Future<Either<Failed, List<BeerModel>>> getBeer(int page);
}

@LazySingleton(as: BeerRepository)
class BeerRepositoryImpl extends BeerRepository {
  @override
  Future<Either<Failed, List<BeerModel>>> getBeer(int page) async {
    Dio _dio = Dio();

    Response response;

    try {
      response = await _dio
          .get('https://api.punkapi.com/v2/beers?page=$page&per_page=15');

      List data = response.data;

      var result = data.map((e) => BeerModel.fromJson(e)).toList();

      return right(result);
    } catch (e) {
      return left(Failed(message: e.toString()));
    }
  }
}
