import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:gov_services_app/modules/model/connection_model.dart';

class ConnectivityProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();
  ConnectionModel connectionModel = ConnectionModel(connectionStr: '');

  Future<void> checkConnectivity() async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.wifi) {
      connectionModel.connectionStr = 'Wifi';
    } else if (connectivityResult == ConnectivityResult.mobile) {
      connectionModel.connectionStr = 'Mobile Network';
    } else {
      connectionModel.connectionStr = 'Offline';
    }
    notifyListeners();
  }
}
