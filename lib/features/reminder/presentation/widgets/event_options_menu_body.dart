import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/utils/events%20utils/delete_event.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/widgets/build_overlay_menu.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/views/widgets/custom_pop_up_menu_item.dart';
import '../../data/model/event_model.dart';

class EventOptionsMenuBody extends StatelessWidget {
  final EventModel event;
  const EventOptionsMenuBody({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPopUpMenuItem(
            onTap: () {
              BuildOverlayMenu.removeOverlay();
              Navigator.of(context)
                  .pushNamed(AppRouter.editReminder, arguments: event);
            },
            title: S.of(context).edit,
            icon: SvgPicture.asset(
              Assets.settingsIcon,
              width: 18.w,
              height: 18.h,
            )),
        SizedBox(
          height: 20.h,
        ),
        CustomPopUpMenuItem(
            onTap: () async {
              BuildOverlayMenu.removeOverlay();
              await deleteEvent(event: event, context: context);
            },
            title: S.of(context).delete,
            icon: SvgPicture.asset(
              Assets.deleteIcon,
              width: 18.w,
              height: 18.h,
            )),
      ],
    );
  }
}
