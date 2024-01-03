import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/credit%20card/sell_and_earn_all_cat_data.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/appLabel/app_label_service.dart';

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen(
      {super.key, required this.headerName, required this.catId});

  final String headerName;
  final String catId;

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [const HomeCustomAppbar(), creditDetails()]));
  }

  Widget creditDetails() {
    return DefaultTabController(
      initialIndex: widget.catId == '6' ? 0 : 1,
      length: 2,
      child: Container(
        margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
        decoration: BoxDecoration(
            color: AppColor.whitecolor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              topLeft: Radius.circular(30.r),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            creditcard(),
            sizeBoxHeight(15.h),
            if (PrefObj.preferences
                    ?.get(PrefKeys.SellEarnLayoutType)
                    .toString() ==
                'tabs')
              tabBar(),
            if (PrefObj.preferences
                    ?.get(PrefKeys.SellEarnLayoutType)
                    .toString() !=
                'tabs')
              const SellAndEarnAllCatData(),
          ],
        ),
      ),
    );
  }

  Widget tabBar() {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 15.w, left: 15.w),
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
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                  unselectedLabelColor: AppColor.graycolor,
                  tabs: [
                    Tab(text: getLabel(personal_loans)),
                    Tab(text: getLabel(credit_line)),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                SellAndEarnAllCatData(),
                SellAndEarnAllCatData(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget creditcard() {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w),
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
            text: widget.headerName,
            fontsize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.blacktextcolor,
          ),
        ],
      ),
    );
  }
}
