import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_task_item.dart';

import '../../view models/tasks/get task cubit/get_task_cubit.dart';
import '../../../../../core/widgets/custom_calender.dart';

class CalenderBody extends StatefulWidget {
  const CalenderBody({super.key});

  @override
  State<CalenderBody> createState() => _CalenderBodyState();
}

class _CalenderBodyState extends State<CalenderBody> {
  @override
  void initState() {
    getIt.get<GetTaskCubit>().getSpecificDayTasks(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Text(
            S.of(context).gregorianCalendar,
            style: Styles.style16W600grey,
          ),
          SizedBox(
            height: 16.h,
          ),
          Image.asset(
            Assets.calenderImage,
            width: 262.w,
            height: 191.h,
          ),
          BlocBuilder<GetTaskCubit, GetTaskState>(
            builder: (context, state) {
              return CustomCalender(
                eventLoader: getIt.get<GetTaskCubit>().getTasksByDate,
                focusedDay: getIt.get<GetTaskCubit>().today,
                selectedDayPredicate: (day) =>
                    isSameDay(day, getIt.get<GetTaskCubit>().today),
                onDaySelected: getIt.get<GetTaskCubit>().onDaySelected,
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            S.of(context).yourTasksForThatDay,
            style: Styles.style16W600grey,
          ),
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            height: 350.h,
            child: BlocBuilder<GetTaskCubit, GetTaskState>(
              builder: (context, state) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    GlobalKey actionKey = GlobalKey();
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsetsDirectional.only(end: 10.w),
                        child: CustomTaskItem(
                          task: getIt
                              .get<GetTaskCubit>()
                              .specificDayTasksList[index],
                          actionKey: actionKey,
                        ));
                  },
                  itemCount:
                      getIt.get<GetTaskCubit>().specificDayTasksList.length,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 16.h,
                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 95.h,
          )
        ],
      ),
    );
  }
}
