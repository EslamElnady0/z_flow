import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_check_box_container.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_data_entry_text_field.dart';

import '../../../../../core/utils/show_category_bottom_sheet.dart';

class TaskDataForm extends StatefulWidget {
  final TextEditingController taskController;
  final TextEditingController endsInController;
  final TextEditingController noteController;
  final TextEditingController categoryController;
  final List<TextEditingController> subTaskControllers;
  final TaskModel? task;
  final bool isEdit;
  final String text;
  final GlobalKey<FormState> formKey;
  const TaskDataForm(
      {super.key,
      required this.taskController,
      required this.endsInController,
      required this.noteController,
      required this.subTaskControllers,
      required this.formKey,
      required this.text,
      this.isEdit = false,
      this.task,
      required this.categoryController});

  @override
  State<TaskDataForm> createState() => _TaskDataFormState();
}

class _TaskDataFormState extends State<TaskDataForm> {
  int maxSubTasks = 5;
  int currentSubTasks = 0;
  List<Widget> subTaskTextFieldsList = [];
  List<String> taskCategories = [];
  @override
  void initState() {
    if (widget.task != null && widget.task!.sideTask[0] != "") {
      for (currentSubTasks = 0;
          currentSubTasks < widget.task!.sideTask.length;
          currentSubTasks++) {
        subTaskTextFieldsList.add(
          Column(
            children: [
              CustomDataEntryTextField(
                  hintText: S.of(context).subTask,
                  validator: (value) {
                    return null;
                  },
                  icon: Padding(
                    padding: EdgeInsetsDirectional.only(end: 15.w),
                    child: SvgPicture.asset(
                      Assets.tasksIcon,
                      height: 16.h,
                      width: 16.w,
                      color: Colors.grey,
                    ),
                  ),
                  controller: widget.subTaskControllers[currentSubTasks]),
              SizedBox(
                height: 16.h,
              )
            ],
          ),
        );
      }
    }
    super.initState();
  }

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
              hintText: S.of(context).task,
              icon: Padding(
                padding: EdgeInsetsDirectional.only(end: 15.w),
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
              validator: (value) {
                return null;
              },
              hintText: S.of(context).endsIn,
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
                          DateFormat.yMMMd('en_US').format(value);
                    });
                  }
                });
              },
              icon: Padding(
                padding: EdgeInsetsDirectional.only(end: 15.w),
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
              hintText: S.of(context).note,
              validator: (value) {
                return null;
              },
              icon: Padding(
                padding: EdgeInsetsDirectional.only(end: 15.w),
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
              hintText: S.of(context).selectCategory,
              keyboardType: TextInputType.none,
              onTap: () {
                showCategoryBottomSheet(
                  context: context,
                  controller: widget.categoryController,
                );
              },
              validator: (value) {
                return null;
              },
              icon: Padding(
                padding: EdgeInsetsDirectional.only(end: 15.w),
                child: SvgPicture.asset(
                  Assets.taskCategoryIcon,
                  height: 16.h,
                  width: 16.w,
                  color: Colors.grey,
                ),
              ),
              controller: widget.categoryController),
          SizedBox(
            height: 16.h,
          ),
          Column(
            children: subTaskTextFieldsList,
          ),
          currentSubTasks == maxSubTasks
              ? const SizedBox.shrink()
              : CustomLightColorsGradientButton(
                  text: S.of(context).addSubTask,
                  icon: Assets.addIcon,
                  onTap: () {
                    setState(() {
                      subTaskTextFieldsList.add(
                        Column(
                          children: [
                            CustomDataEntryTextField(
                                hintText: S.of(context).subTask,
                                icon: Padding(
                                  padding:
                                      EdgeInsetsDirectional.only(end: 15.w),
                                  child: SvgPicture.asset(
                                    Assets.tasksIcon,
                                    height: 16.h,
                                    width: 16.w,
                                    color: Colors.grey,
                                  ),
                                ),
                                controller: widget
                                    .subTaskControllers[currentSubTasks++]),
                            SizedBox(
                              height: 16.h,
                            )
                          ],
                        ),
                      );
                    });
                  },
                ),
          widget.isEdit
              ? Column(
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomCheckBoxContainer(
                      onChanged: (value) async {
                        setState(() {
                          widget.task!.isDone = !(widget.task!.isDone);
                          widget.task!.doneAt = widget.task!.isDone
                              ? DateTime.now().toString()
                              : "";
                        });
                      },
                      value: widget.task!.isDone,
                      text: S.of(context).finishTask,
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
