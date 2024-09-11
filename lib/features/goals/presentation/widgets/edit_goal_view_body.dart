import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/utils/goals%20utils/delete_goal.dart';
import 'package:z_flow/core/utils/goals%20utils/edit_goal.dart';
import 'package:z_flow/features/goals/data/model/goal_model.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/styles/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/views/widgets/custom_data_entry_text_field.dart';
import '../../../home/presentation/views/widgets/save_cancel_actions_row.dart';

class EditGoalViewBody extends StatefulWidget {
  final GoalModel goal;
  const EditGoalViewBody({super.key, required this.goal});

  @override
  State<EditGoalViewBody> createState() => _EditGoalViewBodyState();
}

class _EditGoalViewBodyState extends State<EditGoalViewBody> {
  late TextEditingController controller;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    controller = TextEditingController(text: widget.goal.title);
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
                      S.of(context).editExistingGoal,
                      style: Styles.style14w400,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomDataEntryTextField(
                        minLines: 5,
                        maxLines: 20,
                        hintText: S.of(context).writeYourGoal,
                        icon: Padding(
                          padding: EdgeInsetsDirectional.only(end: 15.w),
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
                        widget.goal.title = controller.text;
                        formKey.currentState!.save();
                        await editGoal(goal: widget.goal);
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      }
                    },
                    onOtherButtonPressed: () async {
                      await deleteGoal(goal: widget.goal);

                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    otherButtonText: S.of(context).delete,
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
