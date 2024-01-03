import 'package:dotted_line/dotted_line.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../api/appLabel/app_label_service.dart';

class WebSiteScreen extends StatefulWidget {
  const WebSiteScreen({super.key});

  @override
  State<WebSiteScreen> createState() => _WebSiteScreenState();
}

class _WebSiteScreenState extends State<WebSiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [const HomeCustomAppbar(), mainContainer()]));
  }

  Widget mainContainer() {
    return Container(
      margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
      decoration: BoxDecoration(
          color: AppColor.whitecolor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
          )),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                sizeBoxHeight(15.h),
              ],
            ),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColor.tabgraycolor,
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.only(
                  top: 20.h, right: 20.w, left: 20.w, bottom: 20),
              child: Column(
                children: [
                  qrCodeShow(),
                  sizeBoxHeight(25),
                  sitePerformance(),
                  sizeBoxHeight(25),
                  enquiresRow(),
                ],
              ),
            )),
          )),
        ],
      ),
    );
  }

  Widget header() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.5.r),
                color: AppColor.bluecolor),
            child: Center(
                child: Image.asset('${AppImages.sellearnimages}back.png',
                    height: 14.h)),
          ),
        ),
        sizeBoxWidth(12.w),
        AppText(
          text: getLabel(website),
          fontsize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.blacktextcolor,
        ),
      ],
    );
  }

  Widget qrCodeShow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
            offset: Offset(1, 1), // Shadow position
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Stack(
          children: [
            Image.asset(
              '${AppImages.websiteImages}qr_back_bg.png',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                '${AppImages.websiteImages}finjoy_logo_qr_screen.png',
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0, // Align at the bottom
              child: Align(
                child: Image.asset(
                  '${AppImages.websiteImages}qr_bg_down_arrow.png',
                  width: 200,
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70, right: 70, top: 50),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColor.lightBlue, width: 5),
                  borderRadius: const BorderRadius.all(Radius.circular(25))
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  child: QrImageView(
                    data: 'https://www.mywebsite.finjoy.com',
                    version: QrVersions.auto,
                  ),
                ),
              ),
              // child: Image.asset(
              //   '${AppImages.websiteImages}qr_code.png',
              // ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0, // Align at the bottom
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    commonButton(
                        onTap: () {},
                        text: getLabel(share),
                        iconPath: '${AppImages.websiteImages}share.png'),
                    commonButton(
                        onTap: () {},
                        text: getLabel(download),
                        iconPath: '${AppImages.websiteImages}download.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sitePerformance() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            blurStyle: BlurStyle.outer,
            offset: Offset(1, 1), // Shadow position
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                children: [
                  Container(
                    width: 5,
                    height: 30,
                    decoration: const BoxDecoration(
                        color: AppColor.bluecolor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),
                  sizeBoxWidth(15),
                  AppText(
                    text: getLabel(site_performance),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontsize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackcolor,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Image.asset(
                    '${AppImages.creditcardimages}bad.png',
                    height: 48.h,
                  ),
                  sizeBoxWidth(20),
                  Expanded(
                    child: AppText(
                      text:
                      getLabel(scope_of_improvement__keep_sharing_the_website_link),
                      fontsize: 13.sp,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColor.whitecolor,
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColor.grayDashcolor,
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: AppText(
                          text: 'https://www.mywebsite.finjoy.com',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontsize: 15.sp,
                          color: AppColor.blackcolor,
                        ),
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          color: AppColor.lightBlue,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              '${AppImages.websiteImages}copy.png',
                              width: 18.w,
                              height: 18.h,
                            ),
                            sizeBoxWidth(8.w),
                            AppText(
                              text: getLabel(copy),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              fontsize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.whitecolor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0, // Align at the bottom
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    commonButton(
                        onTap: () {},
                        text: getLabel(share),
                        iconPath: '${AppImages.websiteImages}share.png'),
                    commonButton(
                        onTap: () {},
                        text: getLabel(visit),
                        iconPath: '${AppImages.websiteImages}visit.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget enquiresRow() {
    return Row(
      children: [
        enquiresCommonContainer('General Enquires', '15'),
        sizeBoxWidth(15),
        enquiresCommonContainer('Vehicle Enquires', '15'),
      ],
    );
  }

  Widget dottedDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DottedLine(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        lineLength: double.infinity,
        lineThickness: 1.5,
        dashLength: 2.5,
        dashColor: Colors.grey.shade300,
        dashRadius: 0.0,
        dashGapLength: 2.5,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }

  Widget enquiresCommonContainer(String title, String enquiresCount) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2,
              blurStyle: BlurStyle.outer,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 5),
            child: Column(
              children: [
                Image.asset(
                  '${AppImages.websiteImages}enquires_user_logo.png',
                  width: 40.w,
                  height: 40.h,
                ),
                sizeBoxHeight(5.w),
                AppText(
                  text: title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  fontsize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackcolor,
                ),
                dottedDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: enquiresCount,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      fontsize: 30.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColor.darkarrowcolor,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: AppText(
                        text: getLabel(enquires),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontsize: 16.sp,
                        color: AppColor.graycolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget commonButton({
    required VoidCallback onTap,
    String text = '',
    String iconPath = '',
  }) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Container(
            height: 47.h,
            decoration: BoxDecoration(
                color: AppColor.whitecolor,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(color: AppColor.bluecolor, width: 1)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconPath,
                    width: 25.w,
                    height: 25.h,
                  ),
                  sizeBoxWidth(8.w),
                  AppText(
                    text: text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontsize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.bluecolor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
