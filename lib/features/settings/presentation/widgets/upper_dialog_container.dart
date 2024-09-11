import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/utils/links lists utils/launch_url.dart';
import 'custom_social_media_item.dart';

class UpperDialogContainer extends StatelessWidget {
  final String image;
  final String name;
  const UpperDialogContainer(
      {super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                topRight: Radius.circular(12.r)),
            gradient: Constants.customAboutDialogGradient),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 200.h,
              width: 200.w,
            ),
            SizedBox(height: 10.h),
            Text(
              name,
              style: Styles.style24W600,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                CustomSocialMediaItem(
                    image: name == "Eslam Elnady"
                        ? Assets.aboutGitHubIcon
                        : Assets.aboutYoutubeIcon,
                    onPressed: () {}),
                SizedBox(
                  width: 13.w,
                ),
                CustomSocialMediaItem(
                    image: Assets.aboutLinkedInIcon,
                    onPressed: () {
                      image == Assets.eslamFlutter
                          ? launchLinkUrl(
                              "https://www.linkedin.com/in/eslam-elnady-58062b25a/")
                          : launchLinkUrl(
                              "https://www.linkedin.com/in/adel-gabr-320752244/");
                    }),
                SizedBox(
                  width: 13.w,
                ),
                CustomSocialMediaItem(
                    image: Assets.aboutMailIcon,
                    onPressed: () {
                      image == Assets.eslamFlutter
                          ? launchLinkUrl("eslamelnady254@gmail.com")
                          : launchLinkUrl("contactadelgabr@gmail.com");
                    }),
                SizedBox(
                  width: 13.w,
                ),
                CustomSocialMediaItem(
                    image: Assets.aboutWhatsIcon,
                    onPressed: () {
                      image == Assets.eslamFlutter
                          ? launchLinkUrl("https://wa.me/+201090964729")
                          : launchLinkUrl("https://wa.me/+201121524545");
                    }),
                SizedBox(
                  width: 13.w,
                ),
                CustomSocialMediaItem(
                    image: Assets.aboutInstaIcon,
                    onPressed: () {
                      image == Assets.eslamFlutter
                          ? launchLinkUrl(
                              "https://www.instagram.com/eslam_elnady2002?igsh=d3FucWg1ZzI2b2pq")
                          : launchLinkUrl(
                              "https://www.instagram.com/adell.og/");
                    }),
              ],
            )
          ],
        ));
  }
}
