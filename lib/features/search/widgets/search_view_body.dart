import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_habit_item.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_task_item.dart';
import 'package:z_flow/features/search/search%20cubit/search_cubit.dart';

import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  final int flag;
  const SearchViewBody({super.key, required this.flag});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Container(
                width: 50.w,
                height: 44.h,
                decoration: BoxDecoration(
                    gradient: Constants.customButtonGradient,
                    borderRadius: BorderRadius.circular(16.r)),
                child: const BackButton(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Container(
                  height: 44.h,
                  decoration: BoxDecoration(
                      gradient: Constants.customItemsGradient,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: CustomSearchTextField(
                    hintText:
                        flag == 0 ? "Search For Tasks" : "Search For Habits",
                    onChanged: (value) {
                      flag == 0
                          ? context
                              .read<SearchCubit>()
                              .searchForTask(query: value)
                          : context
                              .read<SearchCubit>()
                              .searchForHabit(query: value);
                    },
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  itemCount: flag == 0
                      ? context.read<SearchCubit>().tasksSearchResults.length
                      : context.read<SearchCubit>().habitsSearchResults.length,
                  itemBuilder: (context, index) {
                    GlobalKey actionKey = GlobalKey();
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(right: 10.w),
                        child: flag == 0
                            ? CustomTaskItem(
                                task: context
                                    .read<SearchCubit>()
                                    .tasksSearchResults[index],
                                actionKey: actionKey,
                              )
                            : CustomHabitItem(
                                actionKey: actionKey,
                                habit: context
                                    .read<SearchCubit>()
                                    .habitsSearchResults[index]));
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 16.h,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
