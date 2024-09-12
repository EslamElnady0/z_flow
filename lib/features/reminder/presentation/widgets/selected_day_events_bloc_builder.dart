import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/get%20events%20cubit/get_events_cubit.dart';

import 'custom_event_item.dart';

class SelectedDayEventsBlocBuilder extends StatelessWidget {
  const SelectedDayEventsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEventsCubit, GetEventsState>(
        builder: (context, state) {
      return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          GlobalKey actionKey = GlobalKey();
          return CustomEventItem(
            event: getIt.get<GetEventsCubit>().specificDayEventsList[index],
            actionKey: actionKey,
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 12.h,
        ),
        itemCount: getIt.get<GetEventsCubit>().specificDayEventsList.length,
      );
    });
  }
}
