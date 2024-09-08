import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/utils/goals%20utils/add_goal.dart';
import 'package:z_flow/features/goals/data/model/goal_model.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_data_entry_text_field.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/styles/styles.dart';

class AddGoalViewBody extends StatefulWidget {
  const AddGoalViewBody({super.key});

  @override
  State<AddGoalViewBody> createState() => _AddGoalViewBodyState();
}

class _AddGoalViewBodyState extends State<AddGoalViewBody> {
  late TextEditingController controller;
  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Divider(
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      AppTexts.writeAGoal,
                      style: Styles.style14w400,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomDataEntryTextField(
                        minLines: 5,
                        maxLines: 20,
                        hintText: AppTexts.writeYourGoal,
                        icon: Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: SvgPicture.asset(
                            Assets.editIcon,
                            height: 16.h,
                            width: 16.w,
                            color: Colors.grey,
                          ),
                        ),
                        controller: controller)
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: 30.h,
                  ),
                  BottomScreenActions(
                    onPrimaryButtonPressed: () async {
                      if (formKey.currentState!.validate()) {
                        var box = Hive.box(Constants.constantsBox);
                        int id = box.get("goalsId") ?? 0;
                        GoalModel goal = GoalModel(
                            title: controller.text,
                            id: id,
                            createdAt: DateTime.now().toString());
                        await addGoal(goal: goal);
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      }
                    },
                    onOtherButtonPressed: () {
                      Navigator.pop(context);
                    },
                    otherButtonText: AppTexts.cancel,
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
