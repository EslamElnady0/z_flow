import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/work%20session/presentation/ui%20cubits/timer%20cubit/timer_cubit.dart';
import 'package:z_flow/features/work%20session/presentation/ui%20cubits/work%20session%20cubit/work_session_cubit.dart';

import 'work_session_break_body.dart';
import 'work_session_initial_body.dart';
import 'work_session_working_body.dart';

class WorkSessionViewBody extends StatelessWidget {
  const WorkSessionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: BlocBuilder<WorkSessionCubit, WorkSessionState>(
          builder: (context, state) {
            if (state is WorkSessionInitial) {
              return const WorkSessionInitialBody();
            } else if (state is WorkSessionWorking) {
              return BlocListener<TimerCubit, TimerState>(
                listener: (context, state) {
                  if (context.read<TimerCubit>().workingCounter == 0) {
                    context.read<WorkSessionCubit>().startBreak();
                  }
                },
                child: const WorkSessionWorkingBody(),
              );
            } else {
              return BlocListener<TimerCubit, TimerState>(
                listener: (context, state) {
                  if (context.read<TimerCubit>().breakCounter == 0) {
                    context.read<WorkSessionCubit>().backToInitial();
                    context.read<TimerCubit>().breakCounter = 10 * 60;
                    context.read<TimerCubit>().workingCounter = 50 * 60;
                  }
                },
                child: const WorkSessionBreakBody(),
              );
            }
          },
        ));
  }
}
