import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/widgets/custom_svg_icon_widget.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_data_entry_text_field.dart';

class EventDataForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController eventTitle;
  final TextEditingController eventStart;
  final TextEditingController eventEnd;
  final TextEditingController eventNote;
  const EventDataForm(
      {super.key,
      required this.formKey,
      required this.eventTitle,
      required this.eventStart,
      required this.eventEnd,
      required this.eventNote});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomDataEntryTextField(
              hintText: AppTexts.event,
              icon: const CustomSvgIconWidget(icon: Assets.tasksIcon),
              controller: eventTitle),
          SizedBox(
            height: 12.h,
          ),
          CustomDataEntryTextField(
              hintText: AppTexts.startIn,
              icon: const CustomSvgIconWidget(icon: Assets.tasksIcon),
              controller: eventStart),
          SizedBox(
            height: 12.h,
          ),
          CustomDataEntryTextField(
              hintText: AppTexts.endsIn,
              icon: const CustomSvgIconWidget(icon: Assets.tasksIcon),
              controller: eventEnd),
          SizedBox(
            height: 12.h,
          ),
          CustomDataEntryTextField(
              hintText: AppTexts.note,
              icon: const CustomSvgIconWidget(icon: Assets.editIcon),
              minLines: 5,
              maxLines: 10,
              controller: eventNote),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
