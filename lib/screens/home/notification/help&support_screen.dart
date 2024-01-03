// ignore_for_file: file_names

import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/drawer/drawer_screen.dart';
import 'package:finjoy_app/screens/home/notification/lead_related_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';

List helpText = [
  'Training Registration information',
  'About Finjoy',
  'Insurance',
  'Lead related',
  'Payout Related',
  'Bank VERIFICATION',
  'Reffrals',
  'Wallet',
  'Finjoy Coins',
  'Others'
];

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.tabgraycolor,
      body: Column(
        children: [
          bgImage(),
          Expanded(
              child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      helpsupportList(),
                      sizeBoxHeight(vDefaultPadding.h * 2),
                      appLogo(context),
                      sizeBoxHeight(vDefaultPadding * 2.h),
                    ],
                  )))),
        ],
      ),
    );
  }

  Widget bgImage() {
    return Stack(
      children: [
        Image.asset(
          '${AppImages.notificationimages}bg.png',
          height: 103.h,
        ),
        backArrow(),
      ],
    );
  }

  Widget backArrow() {
    return Padding(
      padding: EdgeInsets.only(left: 17.w, top: 52.h, right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                text: getLabel(help_support),
                fontsize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColor.blacktextcolor,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset('${AppImages.notificationimages}music.png',
                  height: 20.h),
            ],
          )
        ],
      ),
    );
  }

  Widget helpsupportList() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: helpText.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index == 3) {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const LeadRelatedScreen();
                  },
                ));
              } else {}
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: vDefaultPadding.w,
                  right: vDefaultPadding.w,
                  bottom: vDefaultSize.h),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.whitecolor,
                    borderRadius: BorderRadius.circular(15.r),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 3.r,
                          blurRadius: 3.r,
                          color: Colors.grey.shade100)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: helpText[index],
                        fontsize: 14.7.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.darktextcolor,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: AppColor.darkarrowcolor,
                        size: 15.sp,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
