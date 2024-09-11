import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/generated/l10n.dart';
import 'package:z_flow/core/constants/colors.dart';
import 'package:z_flow/core/widgets/inner_shadow.dart';
import 'package:z_flow/features/home/presentation/view%20models/time%20management/time%20of%20use%20cubit/time_of_use_cubit.dart';
import 'package:z_flow/features/home/presentation/views/widgets/time_of_use_list_tile_title.dart';

import '../../../../../core/styles/styles.dart';
import 'time_of_use_list_tile_subtitle.dart';

class TimeOfUseViewBody extends StatefulWidget {
  const TimeOfUseViewBody({super.key});

  @override
  State<TimeOfUseViewBody> createState() => _TimeOfUseViewBodyState();
}

class _TimeOfUseViewBodyState extends State<TimeOfUseViewBody> {
  @override
  void initState() {
    context.read<TimeOfUseCubit>().getInstalledUsedAppHelper(startDay: 1);
    super.initState();
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
            S.of(context).easilyKnowHowLongYouUseApp,
            style: Styles.style14w400,
          ),
          SizedBox(
            height: 16.h,
          ),
          FutureBuilder(
              future: context
                  .read<TimeOfUseCubit>()
                  .getInstalledUsedAppHelper(startDay: 1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  for (var i = 0;
                      i < context.read<TimeOfUseCubit>().infos.length;
                      i++) {
                    context.read<TimeOfUseCubit>().totalUsageTime = context
                            .read<TimeOfUseCubit>()
                            .totalUsageTime +
                        context.read<TimeOfUseCubit>().infos[i].usage.inSeconds;
                  }
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InnerShadow(
                          shadows: [
                            BoxShadow(
                                offset: const Offset(0, 4),
                                blurRadius: 4,
                                color: Colors.black.withOpacity(0.25))
                          ],
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10.h),
                              decoration: BoxDecoration(
                                color: ColorManager.primaryColor,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12.w),
                                leading: Container(
                                    width: 40.w,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Image.memory(
                                      snapshot.data![index].icon,
                                    )),
                                title: TimeOfUseListTileTitle(
                                  infos: context.read<TimeOfUseCubit>().infos,
                                  snapshot: snapshot,
                                  index: index,
                                ),
                                subtitle: TimeOfUseListTileSubtitle(
                                  infos: context.read<TimeOfUseCubit>().infos,
                                  totalUsageTime: context
                                      .read<TimeOfUseCubit>()
                                      .totalUsageTime,
                                  index: index,
                                ),
                              )),
                        );
                      },
                      itemCount: snapshot.data!.length,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Text("Permissions!!");
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: ColorManager.primaryColorAccent,
                  ));
                }
              })
        ],
      ),
    );
  }
}
