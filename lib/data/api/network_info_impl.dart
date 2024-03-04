import '../../domain/interfaces/network/network_info.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkInfoImpl implements NetworkInfo {
  Future<bool> dataConnectionChecker = InternetConnection().hasInternetAccess;

  NetworkInfoImpl();

  @override
  Future<bool> get isConnected => dataConnectionChecker;
}
