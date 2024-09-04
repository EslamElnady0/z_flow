import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/goals/presentation/view%20models/get%20goals%20cubit/get_goals_cubit.dart';

class GoalsViewBody extends StatefulWidget {
  const GoalsViewBody({super.key});

  @override
  State<GoalsViewBody> createState() => _GoalsViewBodyState();
}

class _GoalsViewBodyState extends State<GoalsViewBody> {
  @override
  void dispose() {
    if (getIt.isRegistered<GetGoalsCubit>()) {
      getIt<GetGoalsCubit>().close();
      getIt.unregister<GetGoalsCubit>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [],
      ),
    );
  }
}
