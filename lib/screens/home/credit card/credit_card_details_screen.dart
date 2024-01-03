import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/credit%20card/details_tab.dart';
import 'package:finjoy_app/screens/home/credit%20card/earnings_tab.dart';
import 'package:finjoy_app/screens/home/credit%20card/share_content_tab.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:finjoy_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../api/appLabel/app_label_service.dart';

class CreditCardDetailsScreen extends StatefulWidget {
  const CreditCardDetailsScreen({super.key});

  @override
  State<CreditCardDetailsScreen> createState() =>
      _CreditCardDetailsScreenState();
}

class _CreditCardDetailsScreenState extends State<CreditCardDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // getFinancialOfferDetail(); // Call the function to fetch data
  }

  // Future<void> getFinancialOfferDetail() async {
  //   try {
  //     getData = GetFinancialOfferlistModel();
  //     String? OfferId = PrefObj.preferences?.get(PrefKeys.OfferId);
  //     final result = await _repository.onGetFinancialOfferDetail(OfferId!);
  //     print('dfgftghrf  ===>   ${getData}');
  //     if (result != null) {
  //       setState(() {
  //         getData = result;
  //         print('dfgftghrf  ===>   ${getData}');
  //       });
  //     }
  //   } catch (e) {
  //     print('dfgftghrf  ===>   ${e.toString()}');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [const HomeCustomAppbar(), creditDetails()]));
  }

  Widget creditDetails() {
    return DefaultTabController(
      length: 3,
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
            creditcard(),
            sizeBoxHeight(12.h),
            tabBar(),
          ],
        ),
      ),
    );
  }

  Widget creditcard() { 
    return Padding(
      padding: EdgeInsets.only(top: 15.h, right: 15.w, left: 15.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushReplacement(context, CupertinoPageRoute(
              //   builder: (context) {
              //     return const BottomBarPage();
              //   },
              // ));
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
            text: PrefObj.preferences!.get(PrefKeys.OfferTitle),
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
                    Tab(text: getLabel(details)),
                    Tab(text: getLabel(share_content)),
                    Tab(text: getLabel(earnings)),
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                DetailsTab(),
                ShareContentTab(),
                EarningsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
