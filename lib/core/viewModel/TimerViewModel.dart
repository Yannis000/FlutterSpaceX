import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../manager/timer_manager.dart';

class TimerViewModel extends ChangeNotifier {

  String? timeEnd;
  String? timeLeft;

  TimerViewModel(this.timeEnd) {
    refreshTimer();
  }

  void refreshTimer(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timeLeft = TimerManager().intToTimeLeft(TimerManager()
          .convertDateTime(timeEnd ?? "")
          .difference(DateTime.now())
          .inSeconds);
      notifyListeners();
    });
  }
}