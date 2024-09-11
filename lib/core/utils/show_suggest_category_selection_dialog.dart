import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/utils/show_category_bottom_sheet.dart';
import 'package:z_flow/features/home/data/models/task%20model/task_model.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';

import 'tasks utils/add_task.dart';

void showSuggestCategorySelectionDialog(BuildContext context,
    TextEditingController controller, TaskModel task) async {
  await showDialog(
      useRootNavigator: true,
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 25.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: Constants.customSuggestCategorySelectionGradient),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              SizedBox(
                height: 20.h,
              ),
              Image.asset(
                Assets.suggestCategoryImage,
                height: 114.h,
                width: 131.w,
              ),
              Text(
                S.of(context).addToYourCategories,
                style: Styles.style26W600,
              ),
              Text(
                S.of(context).organizingTasks,
                textAlign: TextAlign.center,
                style: Styles.style15w400.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 24.h,
              ),
              BottomScreenActions(
                onOtherButtonPressed: () async {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  await addTask(
                    task: task,
                    context: context,
                  );
                },
                otherButtonText: S.of(context).cancel,
                primaryButtonText: S.of(context).continue_,
                onPrimaryButtonPressed: () {
                  Navigator.pop(context);
                  showCategoryBottomSheet(
                      context: context, controller: controller);
                },
              ),
              SizedBox(
                height: 16.h,
              )
            ]),
          ),
        );
      });
}
