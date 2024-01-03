import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/finjoy%20briefcase/finjoy_briefcase_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../api/const/config.dart';
import '../../../const/behaviour.dart';
import 'package:http/http.dart' as http;

import '../../../utils/shared_pref.dart';
import '../../../widgets/utils.dart';

class EarningsTab extends StatefulWidget {
  const EarningsTab({
    super.key,
  });

  @override
  State<EarningsTab> createState() => _EarningsTabState();
}

class _EarningsTabState extends State<EarningsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchData();
    });
  }

  static Map<String, int> labels = {};

  fetchData() async {
    final Uri url = Uri.parse(Config.getOfferEarningUrl);
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${PrefObj.preferences?.get(PrefKeys.DEVICETOKEN)}', // Replace with your authorization logic
    };
    final Map<String, String> params = {
      'offerid': PrefObj.preferences?.get(PrefKeys.OfferId),
    };

    final Uri finalUrl = url.replace(queryParameters: params);

    final response = await http.get(finalUrl, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['success']) {
        setState(() {
          labels = Map<String, int>.from(data['data']);
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } else {
      throw Exception('Failed to fetch data');
    }


  }

  String getValue(String key) {
    return labels[key].toString();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.tabgraycolor
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  totalearning(),
                  sizeBoxHeight(30.h),
                  // labalChard(),
                  pendingPay(),
                  sizeBoxHeight(25.h),
                  shareWithNetwork(),
                  sizeBoxHeight(25.h),
                  addCustomerReq(),
                  sizeBoxHeight(60.h),
                  myCustomer(),
                  sizeBoxHeight(20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget totalearning() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  text: getLabel(sales_achieved),
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blacktextcolor,
                ),
                sizeBoxHeight(12.h),
                AppText(
                  text: getValue('noofsales'),
                  fontsize: 35.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.orangecolor,
                ),
              ],
            ),
          ),
          sizeBoxWidth(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  text: getLabel(total_earning),
                  fontsize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.blacktextcolor,
                ),
                sizeBoxHeight(12.h),
                AppText(
                  text: currencyFormate(getValue('earninginrupees')),
                  maxLines: 1,
                  fontsize: 35.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColor.greenncolor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget pendingPay() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Container(
        height: 124.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.whitecolor,
          boxShadow: [
            BoxShadow(
                spreadRadius: 3.r,
                blurRadius: 3.r,
                color: Colors.grey.shade100),
          ],
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppText(
              text: getLabel(pending_earning),
              fontsize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.blacktextcolor,
            ),
            sizeBoxHeight(12.h),
            AppText(
              text: currencyFormate(getValue('pendingpayments')),
              fontsize: 37.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xff8B8B8B),
            ),
          ],
        ),
      ),
    );
  }

  Widget shareWithNetwork() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.whitecolor,
          boxShadow: [
            BoxShadow(
                spreadRadius: 3.r,
                blurRadius: 3.r,
                color: Colors.grey.shade100),
          ],
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(22.r)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppText(
                      text: getLabel(share_link_with_network),
                      fontsize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.blacktextcolor,
                    ),
                    sizeBoxHeight(2.h),
                    AppText(
                      text: getLabel(grow_and_earn),
                      fontsize: 13.sp,
                      color: AppColor.blacktextcolor,
                    ),
                    sizeBoxHeight(20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    sizeBoxHeight(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('${AppImages.homeimages}insta.png',
                            height: 29.h),
                        sizeBoxWidth(10),
                        Image.asset('${AppImages.homeimages}fb.png',
                            height: 29.h),
                        sizeBoxWidth(10),
                        Image.asset('${AppImages.homeimages}telegram.png',
                            height: 29.h),
                        sizeBoxWidth(10),
                        Image.asset('${AppImages.homeimages}whatsapp.png',
                            height: 29.h),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: Image.asset(
                  '${AppImages.creditcardimages}user_vector.png',height: 50,),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget addCustomerReq() {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: AppColor.whitecolor,
          boxShadow: [
            BoxShadow(
                spreadRadius: 3.r,
                blurRadius: 3.r,
                color: Colors.grey.shade100),
          ],
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(22.r)),
          child: DottedBorder(
            borderType: BorderType.RRect,
            stackFit: StackFit.loose,
            color: AppColor.graybordercolor,
            radius: Radius.circular(22.r),
            dashPattern: const [4],
            child: Stack(
                children: [
                  Image.asset('${AppImages.creditcardimages}add_customer_bg_design.png', height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,top: 15,right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: Image.asset('${AppImages.creditcardimages}add_customer_icon.png', height: 35,width: 35,),
                          ),
                          AppText(
                            text: getLabel(grow_your_earning),
                            fontsize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColor.blacktextcolor,
                          ),
                          sizeBoxHeight(2.h),
                          Expanded(
                            child: AppText(
                              text: getLabel(grow_your_earning_description),
                              fontsize: 13.sp,
                              color: AppColor.blacktextcolor,
                            ),
                          ),
                          sizeBoxHeight(20.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, CupertinoPageRoute(
                                builder: (context) {
                                  return const FinjoyBriefcaseScreen();
                                },
                              ));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 15.w, right: 15.w),
                              child: Container(
                                height: 40.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: AppColor.lightBlueDisable),
                                child: Center(
                                  child: AppText(
                                    text: getLabel(add_customer),
                                    fontsize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.whitecolor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          sizeBoxHeight(25.h),
                        ],
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ),
      )
    );
  }

  Widget myCustomer() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) {
            return const FinjoyBriefcaseScreen();
          },
        ));
      },
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Container(
          height: 53.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: AppColor.bluecolor),
          child: Center(
            child: AppText(
              text: getLabel(go_to_my_customers),
              fontsize: 13.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.whitecolor,
            ),
          ),
        ),
      ),
    );
  }
}
