import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:z_flow/core/constants/colors.dart';

void launchLinkUrl(String url) async {
  try {
    Uri uri = Uri.parse(url);

    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      url = 'http://$url';
      uri = Uri.parse(url);
      await launchUrl(uri);
    } else {
      await launchUrl(uri);
    }
  } catch (e) {
    Fluttertoast.showToast(
        msg: 'Could not launch $url maybe it is not a valid url',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorManager.chipBackground,
        textColor: Colors.white,
        fontSize: 16.sp);
  }
}
