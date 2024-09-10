import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow/core/utils/habits%20utils/add_habit.dart';
import 'package:z_flow/core/utils/habits%20utils/get_habits.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/constants/constants.dart';
import 'habit_data_form.dart';
import 'save_cancel_actions_row.dart';

class AddHabitViewBody extends StatefulWidget {
  const AddHabitViewBody({super.key});

  @override
  State<AddHabitViewBody> createState() => _AddHabitViewBodyState();
}

class _AddHabitViewBodyState extends State<AddHabitViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController habitController;
  late TextEditingController endsInController;
  late HabitModel habit;
  late TextEditingController noteController;

  @override
  void initState() {
    habitController = TextEditingController();
    endsInController = TextEditingController();

    noteController = TextEditingController();
    habit = HabitModel();
    super.initState();
  }

  @override
  void dispose() {
    habitController.dispose();
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
              habitController: habitController,
              endsInController: endsInController,
              text: AppTexts.youAreAboutToAddHabit,
              habit: habit,
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
                  onPrimaryButtonPressed: () async {
                    if (formKey.currentState!.validate()) {
                      var box = Hive.box(Constants.constantsBox);
                      int id = box.get("habitsId") ?? 0;
                      habit.title = habitController.text;
                      habit.deadline = endsInController.text;
                      habit.createdAt = DateTime.now().toString();
                      habit.id = id;

                      await addHabit(
                        habit: habit,
                      );
                      await getHabits();
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
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
