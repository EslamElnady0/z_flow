import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/styles/styles.dart';
import 'custom_data_entry_text_field.dart';

class HabitDataForm extends StatefulWidget {
  final TextEditingController taskController;
  final TextEditingController endsInController;
  final TextEditingController noteController;

  final String text;
  final GlobalKey<FormState> formKey;
  const HabitDataForm(
      {super.key,
      required this.taskController,
      required this.endsInController,
      required this.noteController,
      required this.text,
      required this.formKey});

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
          // CustomCheckBoxContainer(
          //   text: AppTexts.remiderToHabit,
          //   onChanged: (value) {},
          // ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
