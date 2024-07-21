import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/home/presentation/views/widgets/custom_check_box.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/styles/styles.dart';
import 'build_overlay_menu.dart';

class CustomTaskItem extends StatefulWidget {
  final GlobalKey actionKey;
  const CustomTaskItem({
    super.key,
    required this.actionKey,
  });

  @override
  State<CustomTaskItem> createState() => _CustomTaskItemState();
}

class _CustomTaskItemState extends State<CustomTaskItem> {
  @override
  void dispose() {
    BuildOverlayMenu.removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const CustomCheckBox(),
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
                  "Tessdfsjfskfj;lsks;lf;klsfklsfl;sf;lskf;lsfk;lkf;lsdkfksd;fkslkf;sdlfksdfsddssks;ldkk;t",
                  overflow: TextOverflow.ellipsis,
                  style: Styles.style16W600grey.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
              IconButton(
                key: widget.actionKey,
                onPressed: () {
                  BuildOverlayMenu.showOverlay(context, widget.actionKey);
                },
                icon: Icon(Icons.more_vert, color: Colors.black, size: 20.r),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
