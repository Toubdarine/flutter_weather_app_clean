import 'package:dartz/dartz.dart';

import '../../../foundation/failures/failure.dart';
import '../../entites/address_entity.dart';

abstract class AutoCompleteRepository {
  Future<Either<Failure, List<AddressEntity>>> getSuggestions(String text);
}
