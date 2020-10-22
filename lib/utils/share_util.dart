 import 'package:social_share_plugin/social_share_plugin.dart';

class ShareUtil {
  static const String img =
      '/data/user/0/com.example.flutterapp/cache/img2020-09-23 19:30:51.836764.png';

  static void shareIns() async {
   // InstagramShare.share(img, "image");
    await SocialSharePlugin.shareToFeedInstagram(path: img);

  }

  static void shareFacebook() async {
    //   await SocialSharePlugin.shareToFeedFacebook(path: img);

    await SocialSharePlugin.shareToFeedFacebookLink(quote: 'quote', url: 'https://flutter.dev');
  }

  static void shareTwitter() async {
    var data = await SocialSharePlugin.shareToTwitterLink(text: 'text', url: 'https://flutter.dev');

    print(data);
  }

// static void shareWhatsApp() async {
//   var data = await SocialShare.shareWhatsapp("Hello World \n https://google.com");
//   print(data);
// }
}
