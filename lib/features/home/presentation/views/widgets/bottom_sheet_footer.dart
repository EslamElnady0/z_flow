import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/select%20task%20categories%20cubit/select_task_categories_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_light_colors_gradient_button.dart';
import 'package:z_flow/features/home/presentation/views/widgets/save_cancel_actions_row.dart';

class BottomSheetFooterBlocBuilder extends StatelessWidget {
  final TextEditingController titleController;
  const BottomSheetFooterBlocBuilder(
      {super.key, required this.titleController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectTaskCategoriesCubit, SelectTaskCategoriesState>(
      builder: (context, state) {
        if (context.read<SelectTaskCategoriesCubit>().taskCategories.isEmpty) {
          return CustomLightColorsGradientButton(
            text: AppTexts.addNewCategory,
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            icon: Assets.addIcon,
            onTap: () {
              context.read<SelectTaskCategoriesCubit>().addCategory();
            },
          );
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: BottomScreenActions(
              onSavePressed: () {
                titleController.text = context
                    .read<SelectTaskCategoriesCubit>()
                    .taskCategories
                    .join(", ");
                Navigator.pop(context);
              },
              onOtherButtonPressed: () {
                Navigator.pop(context);
              },
              otherButtonText: AppTexts.cancel,
            ),
          );
        }
      },
    );
  }
}
