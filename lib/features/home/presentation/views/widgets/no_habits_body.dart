import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../generated/l10n.dart';
import 'custom_light_colors_gradient_button.dart';

class NoHabitsBody extends StatelessWidget {
  const NoHabitsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        Image.asset(
          Assets.noHabitsImage,
          width: 160.w,
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 64.w),
          child: CustomLightColorsGradientButton(
            icon: Assets.addIcon,
            onTap: () {
              Navigator.of(context).pushNamed(AppRouter.addHabit);
            },
            text: S.of(context).addNewHabit,
          ),
        ),
        SizedBox(
          height: 104.h,
        )
      ],
    );
  }
}
