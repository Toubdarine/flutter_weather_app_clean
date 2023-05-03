
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import'./network_info.dart';
import '../../../foundation/failures/failure.dart';
abstract class ApiClient  {
 final NetworkInfo networkInfo;

  ApiClient({required this.networkInfo});

  Future<Either<Failure, http.Response>> getReq(Uri uri) ;
}