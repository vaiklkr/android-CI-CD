import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../api/appLabel/app_label_service.dart';

class NewBottomBarPage extends StatefulWidget {
  const NewBottomBarPage({super.key});

  @override
  State<NewBottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<NewBottomBarPage> {
  int bottomBarCurrentIndex = 0;

  List pageList = [
    // const HomeScreen(),
    // const HomeScreen(),
    // const HomeScreen(),
    // const HomeScreen(),
    // const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: Colors.grey.shade200, spreadRadius: 5)
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bottomBarCurrentIndex = 0;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.h, top: 8.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          '${AppImages.newbottombarimages}home.png',
                          height: 25.sp,
                          color: bottomBarCurrentIndex == 0
                              ? AppColor.bluecolor
                              : AppColor.selectgraycolor,
                        ),
                        sizeBoxHeight(6.h),
                        AppText(
                            text: getLabel(home),
                            fontsize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: bottomBarCurrentIndex == 0
                                ? AppColor.bluecolor
                                : AppColor.selectgraycolor)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bottomBarCurrentIndex = 1;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.h, top: 8.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          '${AppImages.newbottombarimages}people.png',
                          height: 25.sp,
                          color: bottomBarCurrentIndex == 1
                              ? AppColor.bluecolor
                              : AppColor.selectgraycolor,
                        ),
                        sizeBoxHeight(6.h),
                        AppText(
                          text: 'Customer',
                          fontsize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: bottomBarCurrentIndex == 1
                              ? AppColor.bluecolor
                              : AppColor.selectgraycolor,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bottomBarCurrentIndex = 2;
                    });
                  },
                  child: Image.asset(
                    '${AppImages.newbottombarimages}plus.png',
                    height: 45.sp,
                    color: bottomBarCurrentIndex == 2
                        ? AppColor.bluecolor
                        : AppColor.selectgraycolor,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bottomBarCurrentIndex = 3;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.h, top: 8.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          '${AppImages.newbottombarimages}youtube.png',
                          height: 25.sp,
                          color: bottomBarCurrentIndex == 3
                              ? AppColor.bluecolor
                              : AppColor.selectgraycolor,
                        ),
                        sizeBoxHeight(6.h),
                        AppText(
                          text: 'Training',
                          fontsize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: bottomBarCurrentIndex == 3
                              ? AppColor.bluecolor
                              : AppColor.selectgraycolor,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bottomBarCurrentIndex = 4;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.h, top: 8.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          '${AppImages.newbottombarimages}market.png',
                          height: 25.sp,
                          color: bottomBarCurrentIndex == 4
                              ? AppColor.bluecolor
                              : AppColor.selectgraycolor,
                        ),
                        sizeBoxHeight(6.h),
                        AppText(
                          text: 'Marketing',
                          fontsize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: bottomBarCurrentIndex == 4
                              ? AppColor.bluecolor
                              : AppColor.selectgraycolor,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: pageList[bottomBarCurrentIndex],
      ),
    );
  }
}
