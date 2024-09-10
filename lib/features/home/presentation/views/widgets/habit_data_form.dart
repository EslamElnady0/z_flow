import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/styles/styles.dart';
import 'custom_check_box_container.dart';
import 'custom_data_entry_text_field.dart';

class HabitDataForm extends StatefulWidget {
  final TextEditingController habitController;
  final TextEditingController endsInController;
  final TextEditingController noteController;
  final HabitModel habit;
  final bool isEdit;

  final String text;
  final GlobalKey<FormState> formKey;
  const HabitDataForm(
      {super.key,
      required this.habitController,
      required this.endsInController,
      required this.noteController,
      required this.text,
      this.isEdit = false,
      required this.formKey,
      required this.habit});

  @override
  State<HabitDataForm> createState() => _HabitDataFormState();
}

class _HabitDataFormState extends State<HabitDataForm> {
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
            height: 40.h,
          ),
          CustomDataEntryTextField(
              hintText: AppTexts.habit,
              icon: Padding(
                padding: EdgeInsets.only(right: 15.w),
                child: SvgPicture.asset(
                  Assets.tasksIcon,
                  height: 16.h,
                  width: 16.w,
                  color: Colors.grey,
                ),
              ),
              controller: widget.habitController),
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
          CustomCheckBoxContainer(
            text: AppTexts.remiderToHabit,
            value: widget.habit.isIterable,
            onChanged: (value) {
              setState(() {
                widget.habit.isIterable = !widget.habit.isIterable;
              });
            },
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
