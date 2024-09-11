import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../constants/constants.dart';

class BuildOverlayMenu {
  static OverlayEntry? _overlayEntry;

  static OverlayEntry _createOverlayEntry(
      BuildContext context,
      Offset position,
      Widget widget,
      Gradient? gradient,
      double? width,
      num positionOffset,
      EdgeInsetsGeometry? padding) {
    return OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () {
          removeOverlay();
        },
        behavior: HitTestBehavior.translucent,
        child: Stack(
          children: [
            Positioned(
              left: Intl.getCurrentLocale() == "en"
                  ? position.dx - positionOffset
                  : position.dx,
              top: position.dy,
              child: Material(
                color: Colors.transparent,
                child: Container(
                    width: width ?? 150.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        gradient: gradient ?? Constants.customButtonGradient,
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
      {required Widget widget,
      Gradient? gradient,
      double? width,
      num? positionOffset,
      EdgeInsetsGeometry? padding}) {
    removeOverlay();

    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = _createOverlayEntry(context, position, widget, gradient,
        width, positionOffset ?? 115.w, padding);
    Overlay.of(context).insert(_overlayEntry!);
  }

  static void removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
