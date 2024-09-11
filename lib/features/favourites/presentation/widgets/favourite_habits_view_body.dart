import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/assets.dart';

import '../../../../core/styles/styles.dart';
import '../../data/view models/favourite habits cubit/favourite_habits_cubit.dart';
import 'custom_habit_fav_item.dart';

class FavouriteHabitsViewBody extends StatefulWidget {
  const FavouriteHabitsViewBody({super.key});

  @override
  State<FavouriteHabitsViewBody> createState() =>
      _FavouriteHabitsViewBodyState();
}

class _FavouriteHabitsViewBodyState extends State<FavouriteHabitsViewBody> {
  @override
  void initState() {
    context.read<FavouriteHabitsCubit>().getFavHabits();
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
          S.of(context).hereYouCanSeeYourFavTasks,
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
        BlocBuilder<FavouriteHabitsCubit, FavouriteHabitsState>(
          builder: (context, state) {
            return Expanded(
                child: ListView.separated(
                    itemCount:
                        context.read<FavouriteHabitsCubit>().favHabits.length,
                    itemBuilder: (context, index) {
                      GlobalKey actionKey = GlobalKey();
                      return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: CustomHabitFavItem(
                            habit: context
                                .read<FavouriteHabitsCubit>()
                                .favHabits[index],
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
