import 'package:dotted_line/dotted_line.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/drawer/drawer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';

List leadText = [
  'Training Registration information',
  'About Finjoy',
  'Insurance',
  'Lead Related',
];

class LeadRelatedScreen extends StatefulWidget {
  const LeadRelatedScreen({super.key});

  @override
  State<LeadRelatedScreen> createState() => _LeadRelatedScreenState();
}

class _LeadRelatedScreenState extends State<LeadRelatedScreen> {
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
                      child: Padding(
                    padding: EdgeInsets.only(
                      left: vDefaultPadding.w,
                      right: vDefaultPadding.w,
                    ),
                    child: Column(
                      children: [
                        leadRelatedList(),
                        sizeBoxHeight(vDefaultSize.h),
                        dottedLine(),
                        sizeBoxHeight(vDefaultSize.h),
                        callUs(),
                      ],
                    ),
                  )))),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          appLogo(context),
          sizeBoxHeight(vDefaultPadding * 2.h),
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
                text: getLabel(lead_related),
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

  Widget leadRelatedList() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: leadText.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: vDefaultSize.h),
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
                      text: leadText[index],
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
          );
        });
  }

  Widget callUs() {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.r),
                color: AppColor.whitecolor,
                border: Border.all(color: Colors.grey.shade300)),
            child: Padding(
              padding: EdgeInsets.only(
                  top: vDefaultPadding.h * 1.5,
                  bottom: vDefaultPadding.h * 1.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('${AppImages.notificationimages}call.png',
                      height: 25.h),
                  sizeBoxHeight(8.h),
                  AppText(
                    text: getLabel(call_us),
                    fontsize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.darktextcolor,
                  ),
                  sizeBoxHeight(5.h),
                  AppText(
                    text: getLabel(wait_time_2_3_mins),
                    fontsize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.graytext1color,
                  ),
                ],
              ),
            ),
          ),
        ),
        sizeBoxWidth(vDefaultPadding.w),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19.r),
                color: AppColor.whitecolor,
                border: Border.all(color: Colors.grey.shade300)),
            child: Padding(
              padding: EdgeInsets.only(
                  top: vDefaultPadding.h * 1.5,
                  bottom: vDefaultPadding.h * 1.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('${AppImages.notificationimages}email.png',
                      height: 25.h),
                  sizeBoxHeight(8.h),
                  AppText(
                    text: getLabel(email_us),
                    fontsize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.darktextcolor,
                  ),
                  sizeBoxHeight(5.h),
                  AppText(
                    text: getLabel(wait_time_24_48_hrs),
                    fontsize: 9.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.graytext1color,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget dottedLine() {
  return DottedLine(
    direction: Axis.horizontal,
    alignment: WrapAlignment.center,
    lineLength: double.infinity,
    lineThickness: 1.0,
    dashLength: 2.5,
    dashColor: Colors.grey.shade400,
    dashRadius: 0.0,
    dashGapLength: 4.0,
    dashGapColor: Colors.transparent,
    dashGapRadius: 0.0,
  );
}
