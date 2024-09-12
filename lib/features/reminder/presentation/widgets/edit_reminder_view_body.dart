import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/utils/events%20utils/update_event.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';
import 'package:z_flow/features/reminder/data/model/event_model.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/update%20event%20cubit/update_event_cubit.dart';
import 'package:z_flow/features/reminder/presentation/widgets/event_data_form.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/events utils/delete_event.dart';
import '../../../../generated/l10n.dart';

class EditReminderViewBody extends StatefulWidget {
  final EventModel event;
  const EditReminderViewBody({super.key, required this.event});

  @override
  State<EditReminderViewBody> createState() => _EditReminderViewBodyState();
}

class _EditReminderViewBodyState extends State<EditReminderViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController eventTitle;
  late TextEditingController eventStart;
  late TextEditingController eventEnd;
  late TextEditingController timeController;
  late TextEditingController eventNote;
  @override
  void initState() {
    eventTitle = TextEditingController(text: widget.event.title);
    context.read<UpdateEventCubit>().startDateWithNoFormating =
        widget.event.startDate;
    context.read<UpdateEventCubit>().endDateWithNoFormating =
        widget.event.endDate;
    context.read<UpdateEventCubit>().timeIn24Format = widget.event.timeOfEvent;
    eventStart = TextEditingController(
        text: DateFormat.yMMMd('en_US')
            .format(DateTime.parse(widget.event.startDate)));
    eventEnd = TextEditingController(
        text: widget.event.endDate == ""
            ? ''
            : DateFormat.yMMMd('en_US')
                .format(DateTime.parse(widget.event.endDate)));
    eventNote = TextEditingController(text: widget.event.note);
    timeController = TextEditingController(text: widget.event.timeOfEvent);
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
                      isEdit: true,
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
                        widget.event.title = eventTitle.text;
                        widget.event.startDate = context
                            .read<UpdateEventCubit>()
                            .startDateWithNoFormating;
                        widget.event.endDate = context
                            .read<UpdateEventCubit>()
                            .endDateWithNoFormating;
                        widget.event.note = eventNote.text;
                        widget.event.timeOfEvent =
                            context.read<UpdateEventCubit>().timeIn24Format;
                        formKey.currentState!.save();
                        await updateEvent(
                            event: widget.event, context: context);
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      }
                    },
                    onOtherButtonPressed: () async {
                      await deleteEvent(context: context, event: widget.event);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    otherButtonText: S.of(context).delete,
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
