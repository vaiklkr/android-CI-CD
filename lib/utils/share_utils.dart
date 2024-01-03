// ignore_for_file: deprecated_member_use, use_build_context_synchronously, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_button.dart';

class ShareUtils {
  static void shareFileWithText(
      {required BuildContext context,
      required String imageUrl,
      required String shareContent}) async {
    final scaffoldContext = context;
    Loader().showLoader(scaffoldContext);
    if (imageUrl.isNotEmpty) {
      var url = Uri.parse(
          imageUrl.startsWith('http') ? imageUrl : 'https://$imageUrl');
      final response = await http.get(url);
      final bytes = response.bodyBytes;

      final temp = await getTemporaryDirectory();
      final path = '${temp.path}/image.jpg';
      File(path).writeAsBytesSync(bytes);
      Share.shareFiles([path], text: shareContent);
    } else if (shareContent.isNotEmpty) {
      Share.share(shareContent);
    }
    Loader().hideLoader(scaffoldContext);
  }

  static void shareOnWhatsApp(String text, String imageUrl) async {
    var url = Uri.parse(imageUrl.startsWith('http') ? imageUrl : 'https://$imageUrl');
    final response = await http.get(url);
    final bytes = response.bodyBytes;

    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.jpg';
    File(path).writeAsBytesSync(bytes);

    // /data/user/0/com.example.finjoy_app/cache/image.jpg

    // WhatsappShare.share(/*phone: '917567426203'*/ text: text/*, filePath: [path]*/);

    // String urlNew = 'https://wa.me/?text=${Uri.encodeComponent('file://$path')}&image=${Uri.encodeComponent(imageUrl)}';
    String urlNew = 'https://api.whatsapp.com/send?text=Hellothere!&image=${Uri.encodeFull(imageUrl)}';

    if (await canLaunch(urlNew)) {
      await launch(urlNew);
    } else {
      // print("WhatsApp is not instaalled");
    }
  }
}
