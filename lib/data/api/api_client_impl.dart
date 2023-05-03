import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import '../../domain/interfaces/network/api_client.dart';
import '../../foundation/failures/failure.dart';

class ApiClientImpl extends ApiClient {
  ApiClientImpl({required super.networkInfo});
  @override
  Future<Either<Failure, http.Response>> getReq(Uri uri) async {
    var isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          return Right(response);
        } else {
          return Left(ServerFailure(response.statusCode.toString()));
        }
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
