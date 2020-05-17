import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> isConnected() async{
    ConnectivityResult connection = await connectivity.checkConnectivity();
    if(connection == ConnectivityResult.none)
      return false;
    
    else 
      return true;
  }
}
