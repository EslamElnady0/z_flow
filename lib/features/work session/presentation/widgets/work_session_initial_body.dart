import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/styles/styles.dart';
import '../ui cubits/work session cubit/work_session_cubit.dart';
import 'work_session_time_container.dart';

class WorkSessionInitialBody extends StatelessWidget {
  const WorkSessionInitialBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        SizedBox(
          height: 14.h,
        ),
        Text(AppTexts.youAreAboutToOpenWorkSession,
            style: Styles.style14w400, textAlign: TextAlign.center),
        SizedBox(
          height: 30.h,
        ),
        Image.asset(
          Assets.stopWatch,
          height: 210.h,
          width: 210.w,
        ),
        SizedBox(
          height: 50.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const WorkSessionTimeContainer(text: AppTexts.thirtyFiveMinWork),
            SvgPicture.asset(
              Assets.addIcon,
            ),
            const WorkSessionTimeContainer(text: AppTexts.fiveMinBreak),
          ],
        ),
        const Spacer(),
        CustomLightColorsGradientButton(
          text: AppTexts.startNow,
          icon: Assets.playIcon,
          onTap: () {
            context.read<WorkSessionCubit>().startWorking();
          },
        ),
        SizedBox(
          height: 75.h,
        )
      ],
    );
  }
}
