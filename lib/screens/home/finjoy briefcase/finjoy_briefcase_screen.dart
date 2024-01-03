import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/finjoy%20briefcase/visiting_card_screen.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';

List sellList = [
  {
    'image': '${AppImages.finjoybriefcaseimages}visiting.png',
    'name': 'Visiting Card',
  },
  {
    'image': '${AppImages.finjoybriefcaseimages}id.png',
    'name': 'My ID Card',
  },
  {
    'image': '${AppImages.finjoybriefcaseimages}ana.png',
    'name': 'Analytics',
  },
  {
    'image': '${AppImages.finjoybriefcaseimages}team.png',
    'name': 'My Team',
  },
  {
    'image': '${AppImages.finjoybriefcaseimages}cus.png',
    'name': 'Customers',
  },
  {
    'image': '${AppImages.finjoybriefcaseimages}refer.png',
    'name': 'Refer & Earn',
  },
];

class FinjoyBriefcaseScreen extends StatefulWidget {
  const FinjoyBriefcaseScreen({super.key});

  @override
  State<FinjoyBriefcaseScreen> createState() => _FinjoyBriefcaseScreenState();
}

class _FinjoyBriefcaseScreenState extends State<FinjoyBriefcaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [const HomeCustomAppbar(), sellDetails()]));
  }

  Widget sellDetails() {
    return Container(
      // margin: EdgeInsets.only(top: vDefaultPadding * 8.h),
      height: 830.h,
      padding: EdgeInsets.only(top: 22.h, right: 20.w, left: 20.w),
      decoration: BoxDecoration(
          color: AppColor.whitecolor,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r), topLeft: Radius.circular(30.r))),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sellearn(),
              sizeBoxHeight(25.h),
              sellearnDetails(),
              sizeBoxHeight(25.h),
              sizeBoxHeight(10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget sellearn() {
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
          text: getLabel(finjoy_briefcase),
          fontsize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.blacktextcolor,
        ),
      ],
    );
  }

  Widget sellearnDetails() {
    return Wrap(
        spacing: 20.w,
        runSpacing: 30.h,
        children: sellList.asMap().entries.map((entry) {
          final index = entry.key;
          final sell = entry.value;
          return SizedBox(
            width: 82.w,
            child: GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) {
                      return const VisitingCardScreen();
                    },
                  ));
                } else {}
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(sell['image'], height: 25.h),
                  sizeBoxHeight(vDefaultSize.h),
                  AppText(
                    text: sell['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontsize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blacktextcolor,
                  ),
                ],
              ),
            ),
          );
        }).toList());
  }
}
