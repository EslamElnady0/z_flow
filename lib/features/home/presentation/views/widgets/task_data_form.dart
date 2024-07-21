import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_add_button.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_check_box_container.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_data_entry_text_field.dart';

class TaskDataForm extends StatefulWidget {
  final TextEditingController taskController;
  final TextEditingController endsInController;
  final TextEditingController noteController;
  final TextEditingController subTaskController;
  final bool isEdit;
  final String text;
  final GlobalKey<FormState> formKey;
  const TaskDataForm(
      {super.key,
      required this.taskController,
      required this.endsInController,
      required this.noteController,
      required this.subTaskController,
      required this.formKey,
      required this.text,
      this.isEdit = false});

  @override
  State<TaskDataForm> createState() => _TaskDataFormState();
}

class _TaskDataFormState extends State<TaskDataForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              widget.text,
              style: Styles.style14w400,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 14.h,
          ),
          CustomDataEntryTextField(
              hintText: AppTexts.task,
              icon: Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: SvgPicture.asset(
                  Assets.tasksIcon,
                  height: 16.h,
                  width: 16.w,
                  color: Colors.grey,
                ),
              ),
              controller: widget.taskController),
          SizedBox(
            height: 16.h,
          ),
          CustomDataEntryTextField(
              hintText: AppTexts.endsIn,
              keyboardType: TextInputType.none,
              onTap: () {
                showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime.utc(2026))
                    .then((value) {
                  if (value == null) {
                    widget.endsInController.text = '';
                  } else {
                    setState(() {
                      widget.endsInController.text =
                          DateFormat.yMMMd().format(value);
                    });
                  }
                });
              },
              icon: Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: SvgPicture.asset(
                  Assets.calenderIcon,
                  height: 16.h,
                  width: 16.w,
                  color: Colors.grey,
                ),
              ),
              controller: widget.endsInController),
          SizedBox(
            height: 16.h,
          ),
          CustomDataEntryTextField(
              hintText: AppTexts.note,
              validator: (value) {
                return null;
              },
              icon: Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: SvgPicture.asset(
                  Assets.editIcon,
                  height: 16.h,
                  width: 16.w,
                  color: Colors.grey,
                ),
              ),
              minLines: 5,
              maxLines: 5,
              controller: widget.noteController),
          SizedBox(
            height: 16.h,
          ),
          CustomDataEntryTextField(
              hintText: AppTexts.subTask,
              validator: (value) {
                return null;
              },
              icon: Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: SvgPicture.asset(
                  Assets.subTaskIcon,
                  height: 16.h,
                  width: 16.w,
                  color: Colors.grey,
                ),
              ),
              controller: widget.subTaskController),
          SizedBox(
            height: 16.h,
          ),
          CustomAddButton(
            text: AppTexts.addSubTask,
            onTap: () {},
          ),
          widget.isEdit
              ? Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    const CustomCheckBoxContainer(
                      text: AppTexts.finishTask,
                    )
                  ],
                )
              : const SizedBox(),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}