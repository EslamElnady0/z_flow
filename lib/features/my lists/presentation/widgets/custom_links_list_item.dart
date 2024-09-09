import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';
import 'package:z_flow/features/my%20lists/presentation/widgets/links_list_item_dynamic_part.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/styles/styles.dart';

class CustomLinksListItem extends StatefulWidget {
  final int index;
  final LinksListModel linksListModel;

  const CustomLinksListItem({
    super.key,
    required this.index,
    required this.linksListModel,
  });

  @override
  State<CustomLinksListItem> createState() => _CustomLinksListItemState();
}

class _CustomLinksListItemState extends State<CustomLinksListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  void toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward(); // Expand the dynamic part
      } else {
        _controller.reverse(); // Collapse the dynamic part
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _heightFactor = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 3.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            gradient: Constants.customButtonGradient,
          ),
          child: ListTile(
            leading: SvgPicture.asset(Assets.list),
            contentPadding: EdgeInsets.zero,
            dense: true,
            onTap: toggleExpanded,
            title: Text(
              widget.linksListModel.name,
              style: Styles.style16W600grey.copyWith(color: Colors.white),
            ),
            trailing: _isExpanded
                ? SvgPicture.asset(
                    Assets.arrowDownIos,
                    height: 10.h,
                    width: 10.w,
                  )
                : Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                    size: 20.r,
                  ),
          ),
        ),
        SizeTransition(
          sizeFactor: _heightFactor, // Animate the height using the controller
          axisAlignment: 0.0, // Expand from the top
          child: LinksListItemDynamicPart(linksList: widget.linksListModel),
        ),
      ],
    );
  }
}
