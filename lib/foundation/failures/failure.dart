import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  final String errorMessage;

  ServerFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'Server Failure';
  }
}

class LocationFailure extends Failure {
  final String errorMessage;

  LocationFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'Location Failure';
  }
}

class ParseFailure extends Failure {
  final String errorMessage;

  ParseFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'Parse Failure';
  }
}

class CacheFailure extends Failure {
  final String errorMessage;

  CacheFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'Cache Failure';
  }
}

class ConnectionFailure extends Failure {
  final String errorMessage = 'Connection issue \nplease check your wifi';

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'Connection issue \nplease check your wifi';
  }
}
