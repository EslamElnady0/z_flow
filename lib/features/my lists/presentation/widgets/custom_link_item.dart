import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/features/my%20lists/presentation/widgets/link_options_menu_body.dart';

import '../../../../core/constants/assets.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/widgets/build_overlay_menu.dart';
import '../../data/models/link item model/link_item.dart';
import '../../data/models/links list model/links_list_model.dart';
import 'custom_link_chip.dart';

class CustomLinkItem extends StatefulWidget {
  final GlobalKey actionKey;
  final LinksListModel linksListModel;
  final int index;
  final LinkItem linkItem;
  const CustomLinkItem({
    super.key,
    required this.linkItem,
    required this.actionKey,
    required this.linksListModel,
    required this.index,
  });

  @override
  State<CustomLinkItem> createState() => _CustomLinkItemState();
}

class _CustomLinkItemState extends State<CustomLinkItem> {
  @override
  void dispose() {
    BuildOverlayMenu.removeOverlay();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: SvgPicture.asset(
            Assets.linksPin,
            color: Colors.white,
            height: 24.h,
            width: 24.w,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.linkItem.name,
              style: Styles.style20W700white,
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              widget.linkItem.description,
              style: Styles.style16W500grey,
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomLinkChip(url: widget.linkItem.url),
          ],
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(top: 3.h),
          child: GestureDetector(
            onTap: () {
              BuildOverlayMenu.showOverlay(context, widget.actionKey,
                  widget: LinkOptionsMenuBody(
                    linkItem: widget.linkItem,
                    index: widget.index,
                    linksListModel: widget.linksListModel,
                  ));
            },
            child: Icon(
              key: widget.actionKey,
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
