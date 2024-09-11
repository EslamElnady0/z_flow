import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/work%20session/presentation/widgets/custom_pause_play_button.dart';
import 'package:z_flow/features/work%20session/presentation/widgets/custom_timer_with_text.dart';

import '../ui cubits/timer cubit/timer_cubit.dart';

class WorkSessionWorkingBody extends StatefulWidget {
  const WorkSessionWorkingBody({super.key});

  @override
  State<WorkSessionWorkingBody> createState() => _WorkSessionWorkingBodyState();
}

class _WorkSessionWorkingBodyState extends State<WorkSessionWorkingBody> {
  late Timer timer;
  void startWorkingTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (context.read<TimerCubit>().workingCounter >= 0) {
        context.read<TimerCubit>().duration =
            Duration(seconds: context.read<TimerCubit>().workingCounter);
        context.read<TimerCubit>().workingCounter--;
        context.read<TimerCubit>().updateTimer();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    startWorkingTimer();

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
              S.of(context).inWorkSession,
              style: Styles.style14w400,
            ),
            SizedBox(
              height: 80.h,
            ),
            CustomTimerWithText(
              duration: context.read<TimerCubit>().duration,
              value: (context.read<TimerCubit>().workingCounter /
                  context.read<TimerCubit>().workingSeconds),
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
                  startWorkingTimer();
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
