import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/utils/habits%20utils/update_habit.dart';
import 'package:z_flow/features/favourites/data/view%20models/favourite%20habits%20cubit/favourite_habits_cubit.dart';
import 'package:z_flow/features/home/data/models/habit%20model/habit_model.dart';
import 'package:z_flow/features/home/presentation/views/widgets/habit_options_menu_body.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/styles.dart';
import '../../../../../core/widgets/build_overlay_menu.dart';

class CustomHabitFavItem extends StatefulWidget {
  final GlobalKey actionKey;
  final HabitModel habit;
  const CustomHabitFavItem({
    super.key,
    required this.actionKey,
    required this.habit,
  });

  @override
  State<CustomHabitFavItem> createState() => _CustomHabitFavItemState();
}

class _CustomHabitFavItemState extends State<CustomHabitFavItem> {
  @override
  void dispose() {
    BuildOverlayMenu.removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: 17.w,
      ),
      GestureDetector(
        onTap: () async {
          widget.habit.isFavourited = !widget.habit.isFavourited;
          if (!widget.habit.isFavourited) {
            context.read<FavouriteHabitsCubit>().favHabits.remove(widget.habit);
          }
          await updateHabit(habit: widget.habit);
          if (context.mounted) {
            context.read<FavouriteHabitsCubit>().getFavHabits();
          }
        },
        child: SvgPicture.asset(
          Assets.starStroke,
          width: 27.w,
          height: 27.h,
        ),
      ),
      SizedBox(
        width: 10.w,
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 12.w),
          alignment: Alignment.centerLeft,
          height: 50.h,
          decoration: BoxDecoration(
              gradient: Constants.customItemsGradient,
              borderRadius: BorderRadius.circular(8.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 220.w,
                child: Text(
                  widget.habit.title,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.style16W600grey.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
              IconButton(
                key: widget.actionKey,
                onPressed: () {
                  BuildOverlayMenu.showOverlay(context, widget.actionKey,
                      widget: HabitOptionsMenuBody(habit: widget.habit));
                },
                icon: Icon(Icons.more_vert, color: Colors.black, size: 20.r),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        width: 17.w,
      ),
    ]);
  }
}
