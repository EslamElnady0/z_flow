import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/utils/tasks%20utils/categories/add_task_categories.dart';
import 'package:z_flow/features/auth/presentation/views/widgets/custom_auth_textfield.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';

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
            Text(S.of(context).addNewCategoryToList, style: Styles.style14w400),
            SizedBox(
              height: 20.h,
            ),
            CustomAuthTextField(
                hintText: S.of(context).title,
                suffix: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    Assets.tasksIcon,
                    color: Colors.grey.shade500,
                  ),
                ),
                icon: null,
                controller: titleController),
            SizedBox(
              height: 25.h,
            ),
            CustomLightColorsGradientButton(
              text: S.of(context).addNewCategory,
              icon: Assets.addIcon,
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  await addTaskCategory(
                      category: titleController.text, context: context);
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
