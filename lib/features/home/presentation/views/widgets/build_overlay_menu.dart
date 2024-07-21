import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_texts.dart';
import '../../../../../core/constants/assets.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.dart';
import 'custom_pop_up_menu_item.dart';

class BuildOverlayMenu {
  static OverlayEntry? _overlayEntry;

  static OverlayEntry _createOverlayEntry(
    BuildContext context,
    Offset position,
  ) {
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
                    child: Column(
                      children: [
                        CustomPopUpMenuItem(
                            onTap: () {
                              removeOverlay();
                              //TODO: ADD TO FAVOURITES LOGIC
                            },
                            title: AppTexts.favourite,
                            icon: SvgPicture.asset(
                              Assets.starIcon,
                              width: 18.w,
                              height: 18.h,
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomPopUpMenuItem(
                            onTap: () {
                              removeOverlay();
                              Navigator.of(context)
                                  .pushNamed(AppRouter.editTask);
                            },
                            title: AppTexts.edit,
                            icon: SvgPicture.asset(
                              Assets.settingsIcon,
                              width: 18.w,
                              height: 18.h,
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomPopUpMenuItem(
                            onTap: () {
                              removeOverlay();
                              //TODO : ADD DELETE LOGIC
                            },
                            title: AppTexts.delete,
                            icon: SvgPicture.asset(
                              Assets.deleteIcon,
                              width: 18.w,
                              height: 18.h,
                            )),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showOverlay(BuildContext context, GlobalKey key) {
    removeOverlay();

    final RenderBox renderBox =
        key.currentContext!.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = _createOverlayEntry(
      context,
      position,
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  static void removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
