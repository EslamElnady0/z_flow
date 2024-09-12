import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/features/reminder/data/model/event_model.dart';
import 'package:z_flow/features/reminder/presentation/widgets/event_options_menu_body.dart';

import '../../../../core/styles/styles.dart';
import '../../../../core/widgets/build_overlay_menu.dart';

class CustomEventItem extends StatefulWidget {
  final EventModel event;
  final GlobalKey actionKey;
  const CustomEventItem(
      {super.key, required this.event, required this.actionKey});

  @override
  State<CustomEventItem> createState() => _CustomEventItemState();
}

class _CustomEventItemState extends State<CustomEventItem> {
  @override
  void dispose() {
    BuildOverlayMenu.removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          gradient: Constants.customItemsGradient,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 220.w,
              child: Text(
                widget.event.title,
                overflow: TextOverflow.ellipsis,
                style: Styles.style16W600grey
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                BuildOverlayMenu.showOverlay(context, widget.actionKey,
                    widget: EventOptionsMenuBody(
                      event: widget.event,
                    ));
              },
              child: Icon(
                key: widget.actionKey,
                Icons.more_vert,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
