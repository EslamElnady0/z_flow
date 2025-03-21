import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/features/reminder/presentation/view%20models/update%20event%20cubit/update_event_cubit.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/widgets/custom_svg_icon_widget.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_data_entry_text_field.dart';

import '../view models/add event cubit/add_event_cubit.dart';

class EventDataForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController eventTitle;
  final TextEditingController eventStart;
  final TextEditingController eventEnd;
  final TextEditingController timeController;
  final TextEditingController eventNote;
  final bool isEdit;
  const EventDataForm(
      {super.key,
      required this.formKey,
      required this.eventTitle,
      required this.eventStart,
      required this.eventEnd,
      required this.eventNote,
      required this.timeController,
      this.isEdit = false});

  @override
  State<EventDataForm> createState() => _EventDataFormState();
}

class _EventDataFormState extends State<EventDataForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomDataEntryTextField(
              hintText: S.of(context).event,
              icon: const CustomSvgIconWidget(icon: Assets.tasksIcon),
              controller: widget.eventTitle),
          SizedBox(
            height: 12.h,
          ),
          CustomDataEntryTextField(
              hintText: S.of(context).startIn,
              icon: const CustomSvgIconWidget(icon: Assets.calenderIcon),
              onTap: () {
                showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.utc(2026))
                    .then((value) {
                  if (value == null) {
                    widget.eventStart.text = '';
                  } else {
                    setState(() {
                      widget.eventStart.text =
                          DateFormat.yMMMd('en_US').format(value);
                      widget.isEdit
                          ? context
                              .read<UpdateEventCubit>()
                              .startDateWithNoFormating = value.toString()
                          : context
                              .read<AddEventCubit>()
                              .startDateWithNoFormating = value.toString();
                    });
                  }
                });
              },
              keyboardType: TextInputType.none,
              controller: widget.eventStart),
          SizedBox(
            height: 12.h,
          ),
          CustomDataEntryTextField(
              hintText: S.of(context).endsIn,
              onTap: () {
                showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.utc(2026))
                    .then((value) {
                  if (value == null) {
                    widget.eventEnd.text = '';
                  } else {
                    setState(() {
                      widget.eventEnd.text =
                          DateFormat.yMMMd('en_US').format(value);
                      widget.isEdit
                          ? context
                              .read<UpdateEventCubit>()
                              .endDateWithNoFormating = value.toString()
                          : context
                              .read<AddEventCubit>()
                              .endDateWithNoFormating = value.toString();
                    });
                  }
                });
              },
              icon: const CustomSvgIconWidget(icon: Assets.calenderIcon),
              keyboardType: TextInputType.none,
              validator: (p0) => null,
              controller: widget.eventEnd),
          SizedBox(
            height: 12.h,
          ),
          CustomDataEntryTextField(
              hintText: S.of(context).timeHint,
              onTap: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((value) {
                  if (value == null) {
                    widget.timeController.text = '';
                  } else {
                    setState(() {
                      widget.timeController.text = value.format(context);
                      widget.isEdit
                          ? context.read<UpdateEventCubit>().timeIn24Format =
                              '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}'
                          : context.read<AddEventCubit>().timeIn24Format =
                              '${value.hour.toString().padLeft(2, '0')}:${value.minute.toString().padLeft(2, '0')}';
                    });
                  }
                });
              },
              icon: const CustomSvgIconWidget(icon: Assets.timeIcon),
              keyboardType: TextInputType.none,
              validator: (p0) => null,
              controller: widget.timeController),
          SizedBox(
            height: 12.h,
          ),
          CustomDataEntryTextField(
              hintText: S.of(context).note,
              icon: const CustomSvgIconWidget(icon: Assets.editIcon),
              validator: (p0) => null,
              minLines: 5,
              maxLines: 10,
              controller: widget.eventNote),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
