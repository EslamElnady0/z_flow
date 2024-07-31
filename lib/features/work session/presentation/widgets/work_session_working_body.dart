import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';

import '../ui cubits/timer cubit/timer_cubit.dart';
import 'gradient_circular_progress_indicator_painter.dart';

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
              AppTexts.inWorkSession,
              style: Styles.style14w400,
            ),
            SizedBox(
              height: 80.h,
            ),
            SizedBox(
              height: 226.h,
              width: 226.w,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  CustomPaint(
                    painter: GradientCircularProgressPainter(
                        shadow: BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 21.3,
                            color: const Color(0xff0B3F7D).withOpacity(0.48)),
                        strokeWidth: 30,
                        value: (context.read<TimerCubit>().workingCounter /
                            context.read<TimerCubit>().workingSeconds),
                        gradient: Constants.customTimerGradient),
                  ),
                  Center(
                    child: Text(
                      "${context.read<TimerCubit>().duration.inMinutes.remainder(60).toString().padLeft(2, "0")}:${context.read<TimerCubit>().duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
                      style: Styles.style40w700,
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
