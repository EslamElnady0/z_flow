import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/features/home/presentation/ui%20logic/ui%20cubits/select%20task%20categories%20cubit/select_task_categories_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/task_categories_list_view.dart';

import '../../features/home/presentation/views/widgets/bottom_sheet_add_category_body.dart';
import '../../features/home/presentation/views/widgets/bottom_sheet_footer.dart';

void showCategoryBottomSheet(
    {required BuildContext context,
    required TextEditingController controller,
    required List<String> taskCategories}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return BlocProvider(
          create: (context) => SelectTaskCategoriesCubit(),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Builder(builder: (context) {
              return Container(
                  decoration: const BoxDecoration(
                    gradient: Constants.drawerGradient,
                  ),
                  child: BlocBuilder<SelectTaskCategoriesCubit,
                      SelectTaskCategoriesState>(
                    builder: (context, state) {
                      return AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          child: SizedBox(
                            height: state is SelectTaskCategoriesAdd
                                ? MediaQuery.of(context).size.height * 0.34
                                : MediaQuery.of(context).size.height * 0.8,
                            child: state is SelectTaskCategoriesAdd
                                ? const BottomSheetAddCategoryBody()
                                : Column(
                                    children: [
                                      const TaskCategoriesListView(),
                                      SizedBox(
                                        height: 24.h,
                                      ),
                                      const BottomSheetFooterBlocBuilder(),
                                      SizedBox(
                                        height: 24.h,
                                      )
                                    ],
                                  ),
                          ));
                    },
                  ));
            }),
          ),
        );
      });
}
