import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternet() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.mobile &&
      connectivityResult != ConnectivityResult.wifi &&
      connectivityResult != ConnectivityResult.ethernet) {
    return false;
  } else {
    return true;
  }
}
