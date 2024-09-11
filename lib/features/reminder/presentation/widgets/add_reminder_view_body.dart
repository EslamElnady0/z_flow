import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/utils/events%20utils/add_event.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';
import 'package:z_flow/features/reminder/data/model/event_model.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/add%20event%20cubit/add_event_cubit.dart';
import 'package:z_flow/features/reminder/presentation/widgets/event_data_form.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/styles/styles.dart';
import '../../../../generated/l10n.dart';

class AddReminderViewBody extends StatefulWidget {
  const AddReminderViewBody({super.key});

  @override
  State<AddReminderViewBody> createState() => _AddReminderViewBodyState();
}

class _AddReminderViewBodyState extends State<AddReminderViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController eventTitle;
  late TextEditingController eventStart;
  late TextEditingController eventEnd;
  late TextEditingController timeController;
  late TextEditingController eventNote;
  @override
  void initState() {
    eventTitle = TextEditingController();
    eventStart = TextEditingController();
    eventEnd = TextEditingController();
    eventNote = TextEditingController();
    timeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    eventTitle.dispose();
    eventStart.dispose();
    eventEnd.dispose();
    eventNote.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
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
                  SizedBox(
                    height: 20.h,
                  ),
                  EventDataForm(
                      formKey: formKey,
                      timeController: timeController,
                      eventTitle: eventTitle,
                      eventStart: eventStart,
                      eventEnd: eventEnd,
                      eventNote: eventNote)
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  BottomScreenActions(
                    onPrimaryButtonPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var box = Hive.box(Constants.constantsBox);
                        int id = box.get("eventsId") ?? 0;
                        EventModel event = EventModel(
                            title: eventTitle.text,
                            startDate: context
                                .read<AddEventCubit>()
                                .startDateWithNoFormating,
                            endDate: context
                                .read<AddEventCubit>()
                                .endDateWithNoFormating,
                            timeOfEvent:
                                context.read<AddEventCubit>().timeIn24Format,
                            note: eventNote.text,
                            createdAt: DateFormat.yMMMd('en_US')
                                .format(DateTime.now()),
                            id: id);
                        await addEvent(event: event, context: context);
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      }
                    },
                    onOtherButtonPressed: () => Navigator.pop(context),
                    otherButtonText: S.of(context).cancel,
                  ),
                  SizedBox(
                    height: 48.h,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
