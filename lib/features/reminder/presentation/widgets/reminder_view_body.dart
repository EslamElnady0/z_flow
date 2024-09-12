import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/routes/app_router.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/utils/events%20utils/get_events.dart';
import 'package:z_flow/core/widgets/custom_calender.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';
import 'package:z_flow/features/home/presentation/views/widgets/image_switcher.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/get%20events%20cubit/get_events_cubit.dart';
import '../../../../core/DI/service_locator.dart';
import '../../../../generated/l10n.dart';
import 'selected_day_events_bloc_builder.dart';

class ReminderViewBody extends StatefulWidget {
  const ReminderViewBody({super.key});

  @override
  State<ReminderViewBody> createState() => _ReminderViewBodyState();
}

class _ReminderViewBodyState extends State<ReminderViewBody> {
  Future<void> getTodaysEvents() async {
    await getEvents(context);
    getIt
        .get<GetEventsCubit>()
        .getSpecificDayEvents(getIt.get<GetEventsCubit>().focusedDay);
  }

  @override
  void initState() {
    getTodaysEvents();
    super.initState();
  }

  @override
  void dispose() {
    if (getIt.isRegistered<GetEventsCubit>()) {
      getIt<GetEventsCubit>().close();
      getIt.unregister<GetEventsCubit>();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Divider(
                          height: 2.h,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          S.of(context).helpYouStayOrganized,
                          style: Styles.style14w400,
                        ),
                        ImageSwitcher(
                          switchingImages: Constants.switchingReminderImages,
                          height: 170.h,
                        ),
                        BlocBuilder<GetEventsCubit, GetEventsState>(
                          builder: (context, state) {
                            return CustomCalender(
                                eventLoader:
                                    getIt.get<GetEventsCubit>().getEventsByDate,
                                focusedDay: getIt.get<GetEventsCubit>().today,
                                selectedDayPredicate: (day) => isSameDay(
                                    day, getIt.get<GetEventsCubit>().today),
                                onDaySelected: (day, focusDay) {
                                  getIt
                                      .get<GetEventsCubit>()
                                      .onDaySelected(day, focusDay);
                                  getEvents(context);
                                },
                                margin: EdgeInsets.symmetric(horizontal: 15.w));
                          },
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Text(
                          S.of(context).yourEvents,
                          style: Styles.style15w400,
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        const SelectedDayEventsBlocBuilder(),
                      ],
                    ),
                  ),
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomLightColorsGradientButton(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.addReminder);
                },
                text: S.of(context).addANewEvent,
                icon: Assets.addIcon),
            SizedBox(
              height: 48.h,
            )
          ],
        ));
  }
}
