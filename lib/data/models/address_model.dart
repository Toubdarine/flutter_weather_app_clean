import '../../domain/entites/address_entity.dart';

class Address {
  final String name;
  final double latitude;
  final double longitude;
  final String city;
  final String coutry;
  final String? zipCode;
  Address(
      {required this.name,
      required this.latitude,
      required this.coutry,
      required this.longitude,
      required this.city,
      this.zipCode});
  AddressEntity toEntity() {
    return AddressEntity(
        name: name,
        latitude: latitude,
        longitude: longitude,
        city: city,
        zipCode: zipCode,
        country: coutry);
  }
}
