import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/features/goals/presentation/view%20models/get%20goals%20cubit/get_goals_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';

import '../../../../core/styles/styles.dart';
import 'goals_list_view_bloc_builder.dart';

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
        children: [
          Divider(
            height: 2.h,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(AppTexts.onThisPage,
              style: Styles.style14w400, textAlign: TextAlign.center),
          SizedBox(
            height: 12.h,
          ),
          Image.asset(
            Assets.goalsImage,
            height: 270.h,
          ),
          const GoalsListViewBlocBuilder(),
          SizedBox(
            height: 24.h,
          ),
          CustomLightColorsGradientButton(
            text: AppTexts.addAGoal,
            icon: Assets.addIcon,
            onTap: () {
              Navigator.pushNamed(context, AppRouter.addGoal);
            },
          ),
          SizedBox(
            height: 48.h,
          ),
        ],
      ),
    );
  }
}
