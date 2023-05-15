import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';

import 'package:flutter_weather_app_clean/domain/entites/address_entity.dart';
import 'package:flutter_weather_app_clean/domain/interfaces/repositories/autocomplete_repo.dart';
import 'package:flutter_weather_app_clean/domain/use_cases/get_auto_completion_usecase.dart';
import 'package:flutter_weather_app_clean/foundation/failures/failure.dart';
import 'get_auto_completion_usecase_test.mocks.dart';

// Annotation which generates the get_auto_completion_usecase_test.mocks.dart library and the MockWeatherRepository class.
@GenerateNiceMocks([MockSpec<AutoCompleteRepository>()])
void main() {
  late MockAutoCompleteRepository mockRepository;

  late GetAutoCompletion useCase;

  setUp(() {
    mockRepository = MockAutoCompleteRepository();
    useCase = GetAutoCompletion(repository: mockRepository);
  });

  group('GetAutoCompletion', () {
    const tText = 'Paris';
    const AddressEntity tAddress = AddressEntity(
      country: 'France',
      latitude: 0.0,
      longitude: 0.0,
      name: 'Paris',
    );
    List<AddressEntity> tList = [tAddress];

    test(
        'should return List<AddressEntity> when the call to the repository is successful',
        () async {
      // arrange
      when(mockRepository.getSuggestions(tText))
          .thenAnswer((_) async => Right<Failure, List<AddressEntity>>(tList));

      // act
      final result = await useCase.execute(tText);

      // assert
      expect(result, Right(tList));
      verify(mockRepository.getSuggestions(tText));
      verifyNoMoreInteractions(mockRepository);
    });

    test(
        'should return a failure when the call to the repository is unsuccessful',
        () async {
      // arrange
      final tFailure = ServerFailure('Server Failure');
      when(mockRepository.getSuggestions(tText))
          .thenAnswer((_) async => Left(tFailure));

      // act
      final result = await useCase.execute(tText);

      // assert
      expect(result, Left(tFailure));
      verify(mockRepository.getSuggestions(tText));
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
