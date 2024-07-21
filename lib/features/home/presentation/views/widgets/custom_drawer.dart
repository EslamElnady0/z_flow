import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:z_flow/core/constants/assets.dart';
import 'package:z_flow/core/constants/constants.dart';
import 'package:z_flow/core/styles/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r))),
      child: Container(
        decoration: const BoxDecoration(gradient: Constants.drawerGradient),
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            Image.asset(
              Assets.logoFullWord,
              height: 74.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            const Divider(
              thickness: 1.25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: Constants.drawerItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {},
                      leading: SvgPicture.asset(
                        Constants.drawerItems[index]["icon"]!,
                      ),
                      title: Text(
                        Constants.drawerItems[index]["title"]!,
                        style: Styles.style20W700white,
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
