import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../widgets/custom_textfromfield.dart';
import '../bottombar/my_customers_screen.dart';

List transferImage = [
  '${AppImages.walletimages}hdfc.png',
  '${AppImages.walletimages}sbi.png',
  '${AppImages.walletimages}paylater.png',
  '${AppImages.walletimages}hdfc.png',
  '${AppImages.walletimages}sbi.png',
  '${AppImages.walletimages}paylater.png',
  '${AppImages.walletimages}hdfc.png',
  '${AppImages.walletimages}sbi.png',
  '${AppImages.walletimages}paylater.png',
];

List transferBank = [
  'Netflix',
  'Paypal',
  'Paylater',
  'Netflix',
  'Paypal',
  'Paylater',
  'Netflix',
  'Paypal',
  'Paylater',
];

List tex = [
  'Lead ID : 123213232421321',
  'Ref ID: 21324324324',
  'Sales Earning sample',
  'Month subscription',
  'Tax',
  'Buy item',
  'Month subscription',
  'Tax',
  'Buy item',
];

List rupey = [
  '\₹12',
  '\₹10',
  '\₹2',
  '\₹12',
  '\₹10',
  '\₹2',
  '\₹12',
  '\₹10',
  '\₹2',
];


class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {

  bool isClickWithdrawals = false;
  bool isClickSalesEarning = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.tabgraycolor,
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                right: vDefaultPadding.w, left: vDefaultPadding.w),
            child: Column(
              children: [
                sizeBoxHeight(15.h),
                roundedRectBorderWidget,
                sizeBoxHeight(15.h),
                historyDetails(),
                sizeBoxHeight(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget searchTextfiled() {
    return AppSearchTextFormField(
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.datetime,
      suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            '${AppImages.creditcardimages}search.png',
            height: 30.h,
          )),
      label: getLabel(select_date_range_for_transactions),
      hint: '',
    );
  }

  DateTime? startDate;
  DateTime? endDate;
  String fromToDate = '';

  Widget get roundedRectBorderWidget {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            DottedBorder(
              padding: EdgeInsets.zero,
              borderType: BorderType.RRect,
              stackFit: StackFit.loose,
              color: AppColor.graybordercolor,
              radius: Radius.circular(25.r),
              dashPattern: const [4],
              child: GestureDetector(
                onTap: () {
                  showCustomDateRangePicker(
                    context,
                    dismissible: true,
                    minimumDate: DateTime.now().subtract(const Duration(days: 365)),
                    // maximumDate: DateTime.now().add(const Duration(days: 30)),
                    maximumDate: DateTime.now(),
                    endDate: endDate,
                    startDate: startDate,
                    backgroundColor: Colors.white,
                    primaryColor: AppColor.bluecolor,
                    onApplyClick: (start, end) {
                      setState(() {
                        endDate = end;
                        startDate = start;
                        fromToDate = '${startDate?.day}-${startDate?.month}-${startDate?.year} to ${endDate?.day}-${endDate?.month}-${endDate?.year}';
                      });
                    },
                    onCancelClick: () {
                      setState(() {
                        endDate = null;
                        startDate = null;
                        fromToDate = '';
                      });
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    height: 37.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: fromToDate.isNotEmpty ? AppColor.checkedColor : AppColor.grayboxcolor,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: AppText(
                          text: fromToDate.isNotEmpty ? fromToDate : getLabel(select_date_range),
                          fontWeight: FontWeight.w500,
                          color: fromToDate.isNotEmpty ? AppColor.whitecolor : AppColor.blacktextcolor,
                          fontsize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            sizeBoxWidth(15.w),
            DottedBorder(
              padding: EdgeInsets.zero,
              borderType: BorderType.RRect,
              stackFit: StackFit.loose,
              color: AppColor.graybordercolor,
              radius: Radius.circular(25.r),
              dashPattern: const [4],
              child: GestureDetector(
                onTap: () {
                   setState(() {
                     isClickWithdrawals = false;
                     isClickSalesEarning = true;
                   });
                },
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    height: 37.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: isClickSalesEarning ? AppColor.checkedColor : AppColor.grayboxcolor,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: AppText(
                          text: getLabel(sales_earning),
                          fontWeight: FontWeight.w500,
                          color: isClickSalesEarning ? AppColor.whitecolor : AppColor.blacktextcolor,
                          fontsize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            sizeBoxWidth(15.w),
            DottedBorder(
              padding: EdgeInsets.zero,
              borderType: BorderType.RRect,
              stackFit: StackFit.loose,
              color: AppColor.graybordercolor,
              radius: Radius.circular(25.r),
              dashPattern: const [4],
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isClickWithdrawals = true;
                    isClickSalesEarning = false;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Container(
                    height: 37.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: isClickWithdrawals ? AppColor.checkedColor : AppColor.grayboxcolor,
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: AppText(
                          text: getLabel(withdrawals),
                          fontWeight: FontWeight.w500,
                          color: isClickWithdrawals ? AppColor.whitecolor : AppColor.blacktextcolor,
                          fontsize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardDetails() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            '${AppImages.walletimages}walletbg.png',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: getLabel(earnings),
                    fontsize: 19.66.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.whitecolor,
                  ),
                  sizeBoxHeight(5.h),
                  AppText(
                    text: '₹2000',
                    fontsize: 29.49.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.whitecolor,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: getLabel(coins),
                    fontsize: 19.66.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.whitecolor,
                  ),
                  sizeBoxHeight(5.h),
                  AppText(
                    text: '2000',
                    fontsize: 29.49.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.whitecolor,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget historyDetails() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19.r),
          color: AppColor.whitecolor,
          border: Border.all(color: Colors.grey.shade300)),
      child: Padding(
        padding: EdgeInsets.only(bottom: 19.h),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 13.h),
                  child: Container(
                    height: 20.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                      color: AppColor.bluecolor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
                sizeBoxWidth(20.w),
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: AppText(
                    text: getLabel(transactions_history),
                    fontsize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackcolor,
                  ),
                ),
              ],
            ),
            // sizeBoxHeight(25.h),
            sizeBoxHeight(5.h),
            ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: transferImage.length,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 32.w,
                      right: 32.w,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  transferImage[index],
                                  height: 39.h,
                                ),
                                sizeBoxWidth(15.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      text: transferBank[index],
                                      fontsize: 15.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColor.blackcolor,
                                    ),
                                    AppText(
                                      text: tex[index],
                                      fontsize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xffBDBDBD),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            AppText(
                              text: rupey[index],
                              fontsize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColor.greenncolor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
