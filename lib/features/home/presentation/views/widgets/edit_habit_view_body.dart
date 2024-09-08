import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/utils/habits%20utils/update_habit.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/utils/habits utils/delete_habit.dart';
import 'habit_data_form.dart';
import 'save_cancel_actions_row.dart';

class EditHabitViewBody extends StatefulWidget {
  final HabitModel habit;
  const EditHabitViewBody({super.key, required this.habit});

  @override
  State<EditHabitViewBody> createState() => _EditHabitViewBodyState();
}

class _EditHabitViewBodyState extends State<EditHabitViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController taskController;
  late TextEditingController endsInController;

  late TextEditingController noteController;

  @override
  void initState() {
    taskController = TextEditingController(text: widget.habit.title);
    endsInController = TextEditingController(text: widget.habit.deadline);

    noteController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    taskController.dispose();
    endsInController.dispose();

    noteController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: HabitDataForm(
              habit: widget.habit,
              isEdit: true,
              habitController: taskController,
              endsInController: endsInController,
              text: AppTexts.youCanEditHabit,
              formKey: formKey,
              noteController: noteController,
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              children: [
                const Spacer(),
                BottomScreenActions(
                  otherButtonText: AppTexts.delete,
                  onPrimaryButtonPressed: () async {
                    if (formKey.currentState!.validate()) {
                      widget.habit.title = taskController.text;
                      widget.habit.deadline = endsInController.text;
                      //  widget.habit.note = noteController.text;
                      formKey.currentState!.save();
                      await updateHabit(habit: widget.habit);
                      if (context.mounted) {
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  onOtherButtonPressed: () async {
                    await deleteHabit(habit: widget.habit);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                SizedBox(
                  height: 60.h,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
