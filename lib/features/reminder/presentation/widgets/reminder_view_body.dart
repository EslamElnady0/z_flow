import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_calender.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';
import 'package:z_flow/features/home/presentation/views/widgets/image_switcher.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/get%20events%20cubit/get_events_cubit.dart';

import '../../../../core/constants/app_texts.dart';

class ReminderViewBody extends StatelessWidget {
  const ReminderViewBody({super.key});

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
          Text(
            AppTexts.helpYouStayOrganized,
            style: Styles.style14w400,
          ),
          ImageSwitcher(
            switchingImages: Constants.switchingReminderImages,
            height: 170.h,
          ),
          BlocBuilder<GetEventsCubit, GetEventsState>(
            builder: (context, state) {
              return CustomCalender(
                  focusedDay: context.read<GetEventsCubit>().today,
                  selectedDayPredicate: (day) =>
                      isSameDay(day, context.read<GetEventsCubit>().today),
                  onDaySelected: context.read<GetEventsCubit>().onDaySelected,
                  margin: EdgeInsets.symmetric(horizontal: 15.w));
            },
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            AppTexts.yourEvents,
            style: Styles.style15w400,
          ),
          const Spacer(),
          CustomLightColorsGradientButton(
              onTap: () {
                Navigator.pushNamed(context, AppRouter.addReminder);
              },
              text: AppTexts.addANewEvent,
              icon: Assets.addIcon),
          SizedBox(
            height: 48.h,
          )
        ],
      ),
    );
  }
}
