// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'dart:io';
import 'dart:typed_data';

import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import '../../../api/appLabel/app_label_service.dart';
import '../../../core/app_color.dart';
import '../../../core/app_sized_box.dart';
import '../../../utils/shared_pref.dart';
import '../../../widgets/custom_button.dart';

class ShareDetailsScreen extends StatefulWidget {
  final String imageUrl;
  final String shareContent;
  final String shareUrl;

  const ShareDetailsScreen(
      {super.key,
      required this.imageUrl,
      required this.shareContent,
      required this.shareUrl});

  @override
  State<ShareDetailsScreen> createState() => _ShareDetailsScreenState();
}

class _ShareDetailsScreenState extends State<ShareDetailsScreen> {
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;

  String fullShareContent = '';
  String path = "";

  @override
  void initState() {
    super.initState();
    fullShareContent = '${widget.shareContent}\n${widget.shareUrl}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:
            Stack(children: [const HomeCustomAppbar(), fullShareContainer()]));
  }

  Widget fullShareContainer() {
    return Container(
      margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
      decoration: const BoxDecoration(
        color: AppColor.tabgraycolor,
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 80),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: WidgetsToImage(
                          controller: controller,
                          child: shareCardImage(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: AppText(
                        text: fullShareContent,
                        color: AppColor.blackcolor,
                        fontsize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          shareDetailBtn(),
        ],
      ),
    );
  }

  Widget shareDetailBtn() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                setState(() async {
                  Loader().showLoader(context);
                  final bytes = await controller.capture();
                  this.bytes = bytes;
                  final temp = await getTemporaryDirectory();
                  final path = '${temp.path}/image.jpg';
                  File(path).writeAsBytesSync(bytes as List<int>);
                  // Share.shareFiles([path], text: fullShareContent);
                  String urlNew =
                      'https://api.whatsapp.com/send?text=$fullShareContent&image${Uri.encodeFull(path)}';
                  if (await canLaunch(urlNew)) {
                    await launch(urlNew);
                  }
                  Loader().hideLoader(context);
                });
              },
              child: Container(
                width: 150.w,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColor.lightGreenColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey.shade300,
                          spreadRadius: 2)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      '${AppImages.referAndEarnImages}whatsapp_icon.png',
                      height: 30,
                      width: 30,
                      color: AppColor.whitecolor,
                    ),
                    sizeBoxWidth(10),
                    AppText(
                      text: getLabel(whatsapp),
                      color: AppColor.whitecolor,
                      fontsize: 16.h,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ),
            sizeBoxWidth(15),
            GestureDetector(
              onTap: () async {
                setState(() async {
                  Loader().showLoader(context);
                  final bytes = await controller.capture();
                  this.bytes = bytes;
                  final temp = await getTemporaryDirectory();
                  final path = '${temp.path}/image.jpg';
                  File(path).writeAsBytesSync(bytes as List<int>);
                  Share.shareFiles([path], text: fullShareContent);
                  Loader().hideLoader(context);
                });
              },
              child: Container(
                width: 150.w,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColor.bluecolor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: Colors.grey.shade300,
                          spreadRadius: 2)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      '${AppImages.websiteImages}share.png',
                      height: 30,
                      width: 30,
                      color: AppColor.whitecolor,
                    ),
                    sizeBoxWidth(10),
                    AppText(
                      text: getLabel(share),
                      color: AppColor.whitecolor,
                      fontsize: 16.h,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shareCardImage() {
    return Container(
      decoration: const BoxDecoration(color: AppColor.whitecolor),
      child: Column(
        children: [
          Image.network(widget.imageUrl),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(
              color: Colors.grey.shade400,
              height: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: AppText(
                  text: PrefObj.preferences!.get(PrefKeys.FullName).toString(),
                  color: AppColor.blackcolor,
                  fontsize: 16,
                  fontWeight: FontWeight.w500,
                )),
                sizeBoxWidth(5),
                Image.asset(
                  '${AppImages.creditcardimages}phone.png',
                  height: 14,
                  width: 14,
                  color: AppColor.bluecolor,
                ),
                sizeBoxWidth(5),
                AppText(
                  text: PrefObj.preferences!
                      .get(PrefKeys.MobileNumber)
                      .toString(),
                  color: AppColor.blackcolor,
                  fontsize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  '${AppImages.homeimages}finjoy.png',
                  height: 18,
                  width: 18,
                ),
                sizeBoxWidth(8),
                const AppText(
                  text: '100% digital & paperless',
                  color: AppColor.graytext1color,
                  fontsize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(Uint8List bytes) => Image.memory(bytes);
}
