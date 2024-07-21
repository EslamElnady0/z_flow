import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';

class BuildOverlayMenu {
  static OverlayEntry? _overlayEntry;

  static OverlayEntry _createOverlayEntry(
      BuildContext context, Offset position, Widget widget) {
    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          removeOverlay();
        },
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              left: position.dx - 115.w,
              top: position.dy,
              child: Material(
                color: Colors.transparent,
                child: Container(
                    width: 150.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        gradient: Constants.customButtonGradient,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: widget),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showOverlay(BuildContext context, GlobalKey key,
      {required Widget widget}) {
    removeOverlay();

    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = _createOverlayEntry(context, position, widget);
    Overlay.of(context).insert(_overlayEntry!);
  }

  static void removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
