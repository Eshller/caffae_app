// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatusListener {
  static final _singleton = ConnectionStatusListener._internal();
  ConnectionStatusListener._internal();

  static ConnectionStatusListener getInstance() => _singleton;

  final Connectivity _connectivity = Connectivity();
  late StreamController<bool> connectionChangeController;

  bool hasConnection = false;

  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    bool previousConnection = hasConnection;

    if (connectivityResult == ConnectivityResult.none) {
      hasConnection = false;
    } else {
      hasConnection = true;
    }

    // Notify listeners about the connection change
    if (previousConnection != hasConnection) {
      connectionChangeController.add(hasConnection);
    }

    return hasConnection;
  }

  Future<void> initialize() async {
    connectionChangeController = StreamController<bool>.broadcast();
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    await checkConnection();
  }

  void dispose() {
    connectionChangeController.close();
  }
}
