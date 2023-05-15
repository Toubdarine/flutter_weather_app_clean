import 'dart:convert';
import 'package:flutter_weather_app_clean/domain/entites/address_entity.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

import 'package:flutter_weather_app_clean/data/repositories/autocomplete_repo_impl.dart';
import 'package:flutter_weather_app_clean/domain/interfaces/network/api_client.dart';
import 'package:flutter_weather_app_clean/foundation/failures/failure.dart';
import 'auto_complete_repo_test.mocks.dart';

// Annotation which generates the get_auto_complete_repo_test.mocks.dart library and the MockWeatherRepository class.
@GenerateNiceMocks([MockSpec<ApiClient>()])
void main() {
  late MockApiClient mockApiClient;

  late AutoCompleteRepositoryImpl repository;

  setUp(() {
    mockApiClient = MockApiClient();
    repository = AutoCompleteRepositoryImpl(mockApiClient);
  });

  group('getSuggestions', () {
    test(
        'should return list of address entities when the call to api is successful',
        () async {
      final suggestionData = {
        "type": "FeatureCollection",
        "features": [
          {
            "type": "Feature",
            "properties": {
              "datasource": {
                "sourcename": "openstreetmap",
                "attribution": "© OpenStreetMap contributors",
                "license": "Open Database License",
                "url": "https://www.openstreetmap.org/copyright"
              },
              "old_name": "Lutèce",
              "country": "France",
              "country_code": "fr",
              "region": "Metropolitan France",
              "state": "Ile-de-France",
              "city": "Paris",
              "lon": 2.3483915,
              "lat": 48.8534951,
              "state_code": "IDF",
              "state_COG": "11",
              "formatted": "Paris, IDF, France",
              "address_line1": "Paris",
              "address_line2": "IDF, France",
              "category": "administrative",
              "timezone": {
                "name": "Europe/Paris",
                "offset_STD": "+01:00",
                "offset_STD_seconds": 3600,
                "offset_DST": "+02:00",
                "offset_DST_seconds": 7200,
                "abbreviation_STD": "CET",
                "abbreviation_DST": "CEST"
              },
              "result_type": "city",
              "rank": {
                "importance": 0.9317101715588673,
                "confidence": 1,
                "confidence_city_level": 1,
                "match_type": "full_match"
              },
              "place_id":
                  "5194a2957b81c9024059ece5d2533f6d4840f00101f9016517010000000000c00208"
            },
            "geometry": {
              "type": "Point",
              "coordinates": [2.3483915, 48.8534951]
            },
            "bbox": [2.224122, 48.8155755, 2.4697602, 48.902156]
          },
        ],
        "query": {
          "text": "paris",
          "parsed": {"city": "paris", "expected_type": "unknown"}
        }
      };
      final tList = [
        const AddressEntity(
          city: 'Paris',
          name: 'Paris',
          latitude: 48.8534951,
          country: 'France',
          longitude: 2.3483915,
        )
      ];
      final suggestionJson = jsonEncode(suggestionData);

      final uri = Uri.parse(
          'https://api.geoapify.com/v1/geocode/autocomplete?text=paris&apiKey=mockApiKey');
      when(mockApiClient.getReq(uri)).thenAnswer((_) async =>
          Right<Failure, http.Response>(http.Response(suggestionJson, 200)));

      final result = await repository.getSuggestions('paris', 'mockApiKey');
      final actualList = result.getOrElse(() => []);
      expect(result.isRight(), true);
      expect(actualList, tList);
    });

    test('should return failure when the call to api fails', () async {
      final uri = Uri.parse(
          'https://api.geoapify.com/v1/geocode/autocomplete?text=paris&apiKey=mockApiKey');
      when(mockApiClient.getReq(uri))
          .thenAnswer((_) async => Left(ServerFailure('server error')));

      final result = await repository.getSuggestions('paris', 'mockApiKey');

      expect(result.isLeft(), true);
      expect(result,
          Left<Failure, List<AddressEntity>>(ServerFailure('Server Failure')));
    });
  });
}
