import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:meta/meta.dart';

part 'internet_check_state.dart';

class InternetCheckCubit extends Cubit<InternetCheckState> {
  InternetCheckCubit() : super(InternetCheckInitial());

  final Connectivity connectivity = Connectivity();

  bool isDeviceConnected = false;

  checkInternetConnection() async {
    connectivity.onConnectivityChanged
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
