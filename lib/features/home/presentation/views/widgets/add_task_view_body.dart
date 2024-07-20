import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_add_button.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_data_entry_text_field.dart';
import 'package:z_flow/features/on%20boarding/presentaion/views/widgets/custom_on_boarding_skip_button.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              children: [
                const Divider(),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Text(
                    AppTexts.easilyAddYourTasks,
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
                    controller: TextEditingController()),
                SizedBox(
                  height: 16.h,
                ),
                CustomDataEntryTextField(
                    hintText: AppTexts.endsIn,
                    icon: Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: SvgPicture.asset(
                        Assets.calenderIcon,
                        height: 16.h,
                        width: 16.w,
                        color: Colors.grey,
                      ),
                    ),
                    controller: TextEditingController()),
                SizedBox(
                  height: 16.h,
                ),
                CustomDataEntryTextField(
                    hintText: AppTexts.note,
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
                    controller: TextEditingController()),
                SizedBox(
                  height: 16.h,
                ),
                CustomDataEntryTextField(
                    hintText: AppTexts.subTask,
                    icon: Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: SvgPicture.asset(
                        Assets.subTaskIcon,
                        height: 16.h,
                        width: 16.w,
                        color: Colors.grey,
                      ),
                    ),
                    controller: TextEditingController()),
                SizedBox(
                  height: 16.h,
                ),
                CustomAddButton(
                  text: AppTexts.addSubTask,
                  onTap: () {},
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
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
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      text: AppTexts.save,
                      gradient: Constants.customButtonGradient,
                      raduis: 16.r,
                    )),
                    SizedBox(
                      width: 50.w,
                    ),
                    const Expanded(
                        child: CustomHollowButton(
                      text: AppTexts.cancel,
                    )),
                  ],
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
