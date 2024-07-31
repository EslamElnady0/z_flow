import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui cubits/timer cubit/timer_cubit.dart';

class WorkSessionBreakBody extends StatefulWidget {
  const WorkSessionBreakBody({super.key});

  @override
  State<WorkSessionBreakBody> createState() => _WorkSessionBreakBodyState();
}

class _WorkSessionBreakBodyState extends State<WorkSessionBreakBody> {
  late Timer timer;
  startBreakTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (context.read<TimerCubit>().breakCounter >= 0) {
        context.read<TimerCubit>().duration =
            Duration(seconds: context.read<TimerCubit>().breakCounter);
        context.read<TimerCubit>().breakCounter--;
        context.read<TimerCubit>().updateTimer();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    startBreakTimer();

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Column();
  }
}
