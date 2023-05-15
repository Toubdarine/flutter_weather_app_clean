import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  final String name;
  final double latitude;
  final double longitude;
  final String? city;
  final String country;
  final String? zipCode;
  const AddressEntity(
      {required this.name,
      required this.latitude,
      required this.country,
      required this.longitude,
      this.city,
      this.zipCode});

  @override
  List<Object?> get props => [name, country, latitude, longitude];
}
