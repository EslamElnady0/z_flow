import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_textfield.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';
import 'package:z_flow/features/tasks%20cats/presentation/view%20models/add%20tasks%20category%20cubit/add_tasks_category_cubit.dart';

import '../../../../core/DI/service_locator.dart';
import '../../../../core/core cubits/internet check cubit/internet_check_cubit.dart';
import '../../../../core/styles/styles.dart';

class AddCategoryViewBody extends StatefulWidget {
  const AddCategoryViewBody({super.key});

  @override
  State<AddCategoryViewBody> createState() => _AddCategoryViewBodyState();
}

class _AddCategoryViewBodyState extends State<AddCategoryViewBody> {
  var formKey = GlobalKey<FormState>();
  late TextEditingController titleController;

  @override
  void initState() {
    titleController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
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
            Text(AppTexts.addNewCategoryToList, style: Styles.style14w400),
            SizedBox(
              height: 20.h,
            ),
            CustomAuthTextField(
                hintText: "Title..",
                suffix: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    Assets.tasksIcon,
                    color: Colors.grey.shade500,
                  ),
                ),
                icon: null,
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return "This field is required";
                  } else {
                    return null;
                  }
                },
                controller: titleController),
            SizedBox(
              height: 25.h,
            ),
            CustomLightColorsGradientButton(
              text: AppTexts.addNewCategory,
              icon: Assets.addIcon,
              onTap: () async {
                await getIt<AddTasksCategoryCubit>().addTaskCategory(
                    category: titleController.text,
                    isConnected:
                        getIt.get<InternetCheckCubit>().isDeviceConnected,
                    isAnonymous:
                        getIt.get<FirebaseAuth>().currentUser!.isAnonymous);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
