import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/features/my%20lists/data/models/links%20list%20model/links_list_model.dart';

class ListDetailsViewBody extends StatelessWidget {
  final LinksListModel linksList;
  const ListDetailsViewBody({super.key, required this.linksList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [],
      ),
    );
  }
}
