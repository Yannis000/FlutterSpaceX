import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_x/core/viewModel/TimerViewModel.dart';
import 'package:provider/provider.dart';

class Timer extends StatelessWidget {
  @override
  String time;

  Timer(this.time, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TimerViewModel(time),
      child: Consumer<TimerViewModel>(
        builder: (context, TimerViewModel model, child) => Text(
          model.timeLeft ?? "00j 00h 00m 00s",
            style: const TextStyle(fontSize: 38),
          ),
        ),
      );
  }

}
