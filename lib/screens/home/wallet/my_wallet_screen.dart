import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/wallet/history_tab.dart';
import 'package:finjoy_app/screens/home/wallet/my_wallet_tab.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/appLabel/app_label_service.dart';

class MyWalletScreen extends StatefulWidget {

  MyWalletScreen({super.key, required this.tabIndex});

  int tabIndex = 0;

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [const HomeCustomAppbar(), walletDetails()]));
  }

  Widget walletDetails() {
    return DefaultTabController(
      length: 2,
      initialIndex: widget.tabIndex,
      child: Container(
        margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
        decoration: BoxDecoration(
            color: AppColor.whitecolor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              topLeft: Radius.circular(30.r),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mywalletText(),
            sizeBoxHeight(12.h),
            tabBar(),
          ],
        ),
      ),
    );
  }

  Widget mywalletText() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 15.w, left: 15.w),
      child: Row(
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
            text: getLabel(my_wallet),
            fontsize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.blacktextcolor,
          ),
        ],
      ),
    );
  }

  Widget tabBar() {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(right: 15.w, left: 15.w, bottom: vDefaultSize),
            child: Container(
              height: 58.h,
              decoration: BoxDecoration(
                  color: AppColor.tabgraycolor,
                  borderRadius: BorderRadius.circular(100.0)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: TabBar(
                  indicator: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 3.r,
                          blurRadius: 3.r,
                          color: Colors.grey.shade200)
                    ],
                    borderRadius: BorderRadius.circular(42.r),
                    color: AppColor.whitecolor,
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: AppColor.bluecolor,
                  labelStyle: GoogleFonts.poppins(
                      color: AppColor.bluecolor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                  unselectedLabelColor: AppColor.graycolor,
                  tabs: [
                    Tab(text: getLabel(wallet)),
                    Tab(text: getLabel(history)),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                MyWalletTab(),
                HistoryTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
