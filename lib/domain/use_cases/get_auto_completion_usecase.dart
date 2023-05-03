import 'package:dartz/dartz.dart';

import '../../foundation/failures/failure.dart';
import '../entites/address_entity.dart';
import '../interfaces/repositories/autocomplete_repo.dart';

class GetAutoCompletion {
  final AutoCompleteRepository repository;
  GetAutoCompletion({required this.repository});
  Future<Either<Failure, List<AddressEntity>>> execute(String text) async {
    var response = await repository.getSuggestions(text);
    Either<Failure, List<AddressEntity>> result = response.fold((failure) {
      return Left(failure);
    }, (response) {
      return Right(response);
    });
    return result;
  }
}
