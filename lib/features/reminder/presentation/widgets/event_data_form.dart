import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/constants/app_texts.dart';
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
  const EventDataForm(
      {super.key,
      required this.formKey,
      required this.eventTitle,
      required this.eventStart,
      required this.eventEnd,
      required this.eventNote,
      required this.timeController});

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
              hintText: AppTexts.event,
              icon: const CustomSvgIconWidget(icon: Assets.tasksIcon),
              controller: widget.eventTitle),
          SizedBox(
            height: 12.h,
          ),
          CustomDataEntryTextField(
              hintText: AppTexts.startIn,
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
                      widget.eventStart.text = DateFormat.yMMMd().format(value);
                      context.read<AddEventCubit>().startDateWithNoFormating =
                          value.toString();
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
              hintText: AppTexts.endsIn,
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
                      widget.eventEnd.text = DateFormat.yMMMd().format(value);
                      context.read<AddEventCubit>().endDateWithNoFormating =
                          value.toString();
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
              hintText: AppTexts.timeHint,
              onTap: () {
                showTimePicker(context: context, initialTime: TimeOfDay.now())
                    .then((value) {
                  if (value == null) {
                    widget.timeController.text = '';
                  } else {
                    setState(() {
                      widget.timeController.text = value.format(context);
                      context.read<AddEventCubit>().timeIn24Format =
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
              hintText: AppTexts.note,
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
