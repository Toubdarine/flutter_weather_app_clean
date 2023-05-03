class AddressEntity {
  final String name;
  final double latitude;
  final double longitude;
  final String? city;
  final String country;
  final String? zipCode;
  AddressEntity(
      {required this.name,
      required this.latitude,
      required this.country,
      required this.longitude,
      this.city,
      this.zipCode});
}
