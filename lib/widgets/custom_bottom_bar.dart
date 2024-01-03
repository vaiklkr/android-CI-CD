import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/bottombar/home_screen.dart';
import 'package:finjoy_app/screens/home/bottombar/marketing_screen.dart';
import 'package:finjoy_app/screens/home/bottombar/my_customers_screen.dart';
import 'package:finjoy_app/screens/home/bottombar/traning_screen.dart';
import 'package:finjoy_app/screens/home/sell%20&%20earn/sell_earn_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../api/appLabel/app_label_service.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({super.key});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int bottomBarCurrentIndex = 0;

  List pageList = [
    // const HomeScreen(),
    // const MyCustomerScreen(),
    // const SellEarnScreen(fixHeight: 760),
    // const TraningScreen(),
    // const MarketingScreen(),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    pageList = [
      const HomeScreen(),
      const MyCustomerScreen(),
      const SellEarnScreen(),
      const TraningScreen(),
      const MarketingScreen(),
    ];
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.whitecolor,
        bottomNavigationBar: Stack(children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.r,
                    color: Colors.grey.shade100,
                    spreadRadius: 5.r)
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 23.w, right: 23.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomBarCurrentIndex = 0;
                      });
                    },
                    child: Container(
                      color: AppColor.whitecolor,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.h, top: 12.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              '${AppImages.bottombarimages}home.png',
                              height: 22.sp,
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
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomBarCurrentIndex = 1;
                      });
                    },
                    child: Container(
                      color: AppColor.whitecolor,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.h, top: 12.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              '${AppImages.bottombarimages}people_.png',
                              height: 20.sp,
                              color: bottomBarCurrentIndex == 1
                                  ? AppColor.bluecolor
                                  : AppColor.selectgraycolor,
                            ),
                            sizeBoxHeight(6.h),
                            AppText(
                              text: 'My Customers',
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
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomBarCurrentIndex = 3;
                      });
                    },
                    child: Container(
                      color: AppColor.whitecolor,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 5.h,
                            top: 12.h,
                            left: vDefaultPadding * 3.5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              '${AppImages.bottombarimages}youtube.png',
                              height: 20.sp,
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
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomBarCurrentIndex = 4;
                      });
                    },
                    child: Container(
                      color: AppColor.whitecolor,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 5.h, top: 12.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              '${AppImages.bottombarimages}market.png',
                              height: 22.sp,
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
                  ),
                ],
              ),
            ),
          ),
          // Positioned(
          //   bottom: 30.h, // Adjust the position as needed
          //   left: MediaQuery.of(context).size.width / 2 - 30.w, // Centered
          //   child: Container(
          //     height: 60.h,
          //     width: 60.w,
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(40.r),
          //       boxShadow: [
          //         BoxShadow(
          //             blurRadius: 3.r,
          //             spreadRadius: 3.r,
          //             color: AppColor.bluecolor.withOpacity(0.3)),
          //       ],
          //     ),
          //     child: FittedBox(
          //       child: FloatingActionButton(
          //         backgroundColor: AppColor.bluecolor,
          //         onPressed: () {
          //           setState(() {
          //             bottomBarCurrentIndex = 2;
          //           });
          //         },
          //         child: ImageIcon(
          //           AssetImage('${AppImages.bottombarimages}plus.png'),
          //           size: 22.sp,
          //           color: bottomBarCurrentIndex == 2
          //               ? AppColor.whitecolor
          //               : AppColor.whitecolor.withOpacity(0.5),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ]),
        floatingActionButton: Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 2.r,
                  spreadRadius: 2.r,
                  color: AppColor.bluecolor.withOpacity(0.3))
            ],
          ),
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: AppColor.bluecolor,
              onPressed: () {
                setState(() {
                  bottomBarCurrentIndex = 2;
                });
              },
              child: ImageIcon(
                AssetImage('${AppImages.bottombarimages}plus.png'),
                size: 22.sp,
                color: bottomBarCurrentIndex == 2
                    ? AppColor.whitecolor
                    : AppColor.whitecolor.withOpacity(0.5),
              ),
            ),
          ),
        ),
        body: pageList[bottomBarCurrentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
