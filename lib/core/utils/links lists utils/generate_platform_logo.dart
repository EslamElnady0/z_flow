import 'package:z_flow/core/constants/assets.dart';

String getPlatformLogo(String url) {
  url = url.toLowerCase();

  String platformKeyword = '';

  if (url.contains('www.google.com')) {
    platformKeyword = 'google';
  } else if (url.contains('www.facebook.com')) {
    platformKeyword = 'facebook';
  } else if (url.contains('www.youtube.com')) {
    platformKeyword = 'youtube';
  } else if (url.contains('www.linkedin.com')) {
    platformKeyword = 'linkedin';
  } else if (url.contains('www.instagram.com')) {
    platformKeyword = 'instagram';
  } else if (url.contains('www.github.com')) {
    platformKeyword = 'github';
  } else if (url.contains('www.x.com')) {
    platformKeyword = 'x';
  }

  switch (platformKeyword) {
    case 'google':
      return Assets.googleLogo2;
    case 'facebook':
      return Assets.facebookLogo;
    case 'youtube':
      return Assets.youtubeLogo;
    case 'linkedin':
      return Assets.linkedInLogo;
    case 'instagram':
      return Assets.instagramLogo;
    case 'github':
      return Assets.githubLogo;
    case 'x':
      return Assets.xLogo;
    default:
      return Assets.defaultWebSite;
  }
}
