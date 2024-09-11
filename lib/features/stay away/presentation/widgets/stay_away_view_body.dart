import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';
import 'package:z_flow/core/widgets/custom_button.dart';
import 'package:z_flow/features/stay%20away/presentation/cubit/stay_away_cubit.dart';

import 'custom_time_pick_page_view.dart';

class StayAwayViewBody extends StatefulWidget {
  const StayAwayViewBody({super.key});

  @override
  State<StayAwayViewBody> createState() => _StayAwayViewBodyState();
}

class _StayAwayViewBodyState extends State<StayAwayViewBody> {
  late PageController _hoursPageController;
  late PageController _minsPageController;
  double currentHoursPage = 12;
  double currentMinsPage = 59;

  @override
  void initState() {
    _hoursPageController =
        PageController(initialPage: 12, viewportFraction: 0.35);
    _hoursPageController.addListener(() {
      setState(() {
        currentHoursPage = _hoursPageController.page!;
      });
    });
    _minsPageController =
        PageController(initialPage: 59, viewportFraction: 0.35);
    _minsPageController.addListener(() {
      setState(() {
        currentMinsPage = _minsPageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _hoursPageController.dispose();
    _minsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            height: 12.h,
          ),
          Text(
            S.of(context).takeABreak,
            style: Styles.style14w400,
          ),
          SizedBox(
            height: 24.h,
          ),
          Image.asset(
            Assets.stayAwayLock,
            width: 122.w,
          ),
          SizedBox(
            height: 32.h,
          ),
          Row(
            children: [
              const Spacer(
                flex: 3,
              ),
              CustomTimePickPageView(
                controller: _hoursPageController,
                currentPage: currentHoursPage,
                list: Constants.hours,
                suffixString: "hrs",
                isMins: false,
              ),
              const Spacer(
                flex: 3,
              ),
              CustomTimePickPageView(
                controller: _minsPageController,
                currentPage: currentMinsPage,
                list: Constants.minutes,
                suffixString: "mins",
                isMins: true,
              ),
              const Spacer(
                flex: 3,
              )
            ],
          ),
          const Spacer(),
          CustomButton(
            margin: EdgeInsets.symmetric(
              horizontal: 65.w,
            ),
            gradient: Constants.customButtonGradient,
            onTap: () async {
              log(BlocProvider.of<StayAwayCubit>(context).mins.toString());
              await BlocProvider.of<StayAwayCubit>(context).startLockService();
            },
            raduis: 12.r,
            text: S.of(context).lock,
            style: Styles.style24W600.copyWith(color: Colors.white),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
