import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/DI/service_locator.dart';
import 'package:z_flow/core/constants/app_texts.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/features/favourites/presentation/widgets/custom_task_fav_item.dart';

import '../../../../core/styles/styles.dart';
import '../../data/view models/favourite tasks cubit/favourite_tasks_cubit.dart';

class FavouriteTasksViewBody extends StatefulWidget {
  const FavouriteTasksViewBody({super.key});

  @override
  State<FavouriteTasksViewBody> createState() => _FavouriteTasksViewBodyState();
}

class _FavouriteTasksViewBodyState extends State<FavouriteTasksViewBody> {
  @override
  void initState() {
    getIt.get<FavouriteTasksCubit>().getFavTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          endIndent: 12.w,
          indent: 12.w,
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(
          AppTexts.hereYouCanSeeYourFavTasks,
          style: Styles.style14w400,
        ),
        SizedBox(
          height: 16.h,
        ),
        Image.asset(
          Assets.favPhoto,
          width: 167.w,
        ),
        SizedBox(
          height: 24.h,
        ),
        BlocBuilder<FavouriteTasksCubit, FavouriteTasksState>(
          builder: (context, state) {
            return Expanded(
                child: ListView.separated(
                    itemCount: getIt.get<FavouriteTasksCubit>().favTasks.length,
                    itemBuilder: (context, index) {
                      GlobalKey actionKey = GlobalKey();
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CustomTaskFavItem(
                            task: getIt
                                .get<FavouriteTasksCubit>()
                                .favTasks[index],
                            actionKey: actionKey,
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 12.h,
                      );
                    }));
          },
        )
      ],
    );
  }
}
