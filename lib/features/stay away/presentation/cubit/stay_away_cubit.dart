import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

part 'stay_away_state.dart';

class StayAwayCubit extends Cubit<StayAwayState> {
  StayAwayCubit() : super(StayAwayInitial());

  int hours = 0;
  int mins = 0;
  Future<void> startLockService() async {
    // int durationInMillis = (hours * 60 * 60 * 1000) + (mins * 60 * 1000);
    try {
      // await ZFlowApp.platform
      //     .invokeMethod('startLockService', {'duration': durationInMillis});
    } on PlatformException catch (e) {
      log("Failed to start lock service: '${e.message}'.");
    }
  }
}
