import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:z_flow/core/constants/constants.dart';

import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Container(
                width: 50.w,
                height: 44.h,
                decoration: BoxDecoration(
                    gradient: Constants.customItemsGradient,
                    borderRadius: BorderRadius.circular(16.r)),
                child: const BackButton(
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Container(
                  height: 44.h,
                  decoration: BoxDecoration(
                      gradient: Constants.customItemsGradient,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: CustomSearchTextField(
                    onChanged: (value) {},
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
