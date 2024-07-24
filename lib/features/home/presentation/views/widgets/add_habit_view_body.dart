import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_texts.dart';
import 'habit_data_form.dart';
import 'save_cancel_actions_row.dart';

class AddHabitViewBody extends StatefulWidget {
  const AddHabitViewBody({super.key});

  @override
  State<AddHabitViewBody> createState() => _AddHabitViewBodyState();
}

class _AddHabitViewBodyState extends State<AddHabitViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController taskController;
  late TextEditingController endsInController;

  late TextEditingController noteController;

  @override
  void initState() {
    taskController = TextEditingController();
    endsInController = TextEditingController();

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
              taskController: taskController,
              endsInController: endsInController,
              text: AppTexts.youAreAboutToAddHabit,
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
                  otherButtonText: AppTexts.cancel,
                  onOtherButtonPressed: () => Navigator.of(context).pop(),
                  onSavePressed: () {
                    if (formKey.currentState!.validate()) {
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
