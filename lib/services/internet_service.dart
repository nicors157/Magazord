import 'package:connectivity_plus/connectivity_plus.dart';

///Verifica se o dispositivo está conectado a uma rede `WI-FI` ou `DADOS MÓVEIS`
Future<bool> hasInternet() async {
  List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
    //Há conexão
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.none)) {
    //Sem conexão
    return false;
  }

  return false;
}
