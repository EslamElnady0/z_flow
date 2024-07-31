import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_texts.dart';
import '../../../../core/styles/styles.dart';
import '../ui cubits/timer cubit/timer_cubit.dart';
import 'custom_pause_play_button.dart';
import 'custom_timer_with_text.dart';

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
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        return Column(
          children: [
            const Divider(),
            SizedBox(
              height: 14.h,
            ),
            Text(
              AppTexts.inBreakSession,
              style: Styles.style14w400,
            ),
            SizedBox(
              height: 80.h,
            ),
            CustomTimerWithText(
              duration: context.read<TimerCubit>().duration,
              value: (context.read<TimerCubit>().breakCounter /
                  context.read<TimerCubit>().breakSeconds),
            ),
            const Spacer(),
            CustomPausePlayButton(
              onTap: () {
                context.read<TimerCubit>().isPaused =
                    !context.read<TimerCubit>().isPaused;
                if (context.read<TimerCubit>().isPaused) {
                  timer.cancel();
                  context.read<TimerCubit>().updateTimer();
                } else {
                  startBreakTimer();
                  context.read<TimerCubit>().updateTimer();
                }
              },
              isPaused: context.read<TimerCubit>().isPaused,
            ),
            SizedBox(
              height: 90.h,
            )
          ],
        );
      },
    );
  }
}
