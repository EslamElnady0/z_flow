import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

part 'internet_check_state.dart';

class InternetCheckCubit extends Cubit<InternetCheckState> {
  InternetCheckCubit() : super(InternetCheckInitial());

  final Connectivity _connectivity = Connectivity();

  bool isDeviceConnected = false;
  // late StreamSubscription _connectivitySubscription;
  // List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  // Future<void> _initConnectivity() async {
  //   late List<ConnectivityResult> result;
  //   try {
  //     result = await _connectivity.checkConnectivity();
  //   } on PlatformException catch (e) {
  //     log('Couldn\'t check connectivity status', error: e);
  //     return;
  //   }

  //   return _updateConnectionStatus(result);
  // }

  // Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
  //   _connectionStatus = result;
  //   if (_connectionStatus[0] == ConnectivityResult.none) {
  //     emit(InternetCheckDisconnected());
  //   } else {
  //     emit(InternetCheckConnected());
  //   }
  //   // ignore: avoid_print
  //   print('Connectivity changed: $_connectionStatus');
  // }

  checkInternetConnection() async {
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (isDeviceConnected) {
        emit(InternetCheckConnected());
      } else {
        emit(InternetCheckDisconnected());
      }
    });
  }
}
