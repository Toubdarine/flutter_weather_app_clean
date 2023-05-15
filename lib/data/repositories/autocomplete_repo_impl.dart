import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';

import '../../data/models/auto_complete_data_model.dart';
import '../../domain/interfaces/network/api_client.dart';
import '../../domain/interfaces/repositories/autocomplete_repo.dart';
import '../../domain/entites/address_entity.dart';
import '../../foundation/failures/failure.dart';

class AutoCompleteRepositoryImpl extends AutoCompleteRepository {
  final ApiClient apiClient;

  AutoCompleteRepositoryImpl(this.apiClient);

  @override
  Future<Either<ServerFailure, List<AddressEntity>>> getSuggestions(String text,
      [String? apiKey]) async {
    await dotenv.load(fileName: "./.env");
    String key = apiKey ?? dotenv.env['AUTOCOMPLETE_API_KEY']!;
    String autoCompleteApiUrl =
        "https://api.geoapify.com/v1/geocode/autocomplete?text=$text&apiKey=$key";
    Uri uri = Uri.parse(
      autoCompleteApiUrl,
    );

    try {
      final response = await apiClient.getReq(uri);
      Either<ServerFailure, List<AddressEntity>> result;
      result = response.fold(
        (failure) {
          return Left(ServerFailure(failure.toString()));
        },
        (response) {
          final body = jsonDecode(response.body);

          final suggestionBrut = AutoCompleteDataModel.fromJson(body);
          List<AddressEntity> list = [];
          List<Features> featuresList = suggestionBrut.features ?? [];

          if (featuresList.isNotEmpty) {
            for (Features e in featuresList) {
              AddressEntity address = AddressEntity(
                  name: e.properties!.addressLine1!,
                  country: e.properties!.country!,
                  latitude: e.properties!.lat!,
                  longitude: e.properties!.lon!,
                  city: e.properties!.city);

              list.add(address);
            }
          }

          //print(weather);
          return Right(list);
        },
      );

      return result;
    } catch (e) {
      rethrow;
      // return Left(ParseFailure('Failed to retrieve data. Error: $e'));
    }
  }
}
