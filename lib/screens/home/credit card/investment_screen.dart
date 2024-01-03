import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';

class InvestmentScreen extends StatefulWidget {
  const InvestmentScreen({super.key});

  @override
  State<InvestmentScreen> createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends State<InvestmentScreen> {
  bool cardvisiblity = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [const HomeCustomAppbar(), investmentContainer()]));
  }

  Widget investmentContainer() {
    return Container(
      margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
      padding: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w),
      decoration: BoxDecoration(
          color: AppColor.whitecolor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          investmentText(),
          sizeBoxHeight(20.h),
          searchTextfiled(),
          sizeBoxHeight(20.h),
          filterContainer(),
          sizeBoxHeight(20.h),
          Expanded(
              child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Visibility(visible: cardvisiblity, child: investmentCard()),
                  Visibility(visible: !cardvisiblity, child: listCard()),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget investmentText() {
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
          text: getLabel(investment),
          fontsize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.blacktextcolor,
        ),
      ],
    );
  }

  Widget searchTextfiled() {
    return AppSearchTextFormField(
      textInputAction: TextInputAction.done,
      suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset(
            '${AppImages.creditcardimages}search.png',
            height: 35.h,
          )),
      label: getLabel(enter_pincode_to_check_card),
      hint: '',
    );
  }

  Widget filterContainer() {
    return Row(
      children: [
        Container(
          height: 32.h,
          width: 96.w,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    spreadRadius: 3.r,
                    blurRadius: 3.r,
                    color: Colors.grey.shade100),
              ],
              borderRadius: BorderRadius.circular(35.r),
              color: AppColor.whitecolor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppText(
                text: getLabel(filter),
                fontWeight: FontWeight.w500,
                color: AppColor.bluecolor,
                fontsize: 14.sp,
              ),
              Image.asset(
                '${AppImages.mycustomerimages}filter.png',
                height: 12.h,
              )
            ],
          ),
        ),
        sizeBoxWidth(11.w),
        Image.asset(
          '${AppImages.mycustomerimages}line.png',
          height: 30.h,
        ),
        sizeBoxWidth(11.w),
        GestureDetector(
          onTap: () {
            setState(() {
              cardvisiblity = !cardvisiblity;
            });
          },
          child: Container(
            height: 32.h,
            width: 200.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.r),
                color: AppColor.bluecolor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: AppText(
                    text: getLabel(zero_equity_delivery),
                    fontWeight: FontWeight.w500,
                    color: AppColor.whitecolor,
                    fontsize: 14.sp,
                  ),
                ),
                sizeBoxWidth(8.w),
                Container(
                  height: 17.h,
                  width: 17.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColor.whitecolor),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      size: 15.sp,
                      color: AppColor.bluecolor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget investmentCard() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(bottom: 18.h),
              child:

                  //  Image.asset(
                  //   '${AppImages.investmentimages}inve.png',
                  // ));

                  Stack(
                children: [
                  Container(
                      height: 228.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(31.3.r),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 3.r,
                              blurRadius: 3.r,
                              color: Colors.grey.shade100)
                        ],
                      ),
                      child: Image.asset(
                        '${AppImages.investmentimages}card.png',
                        height: 228.h,
                        width: 390.w,
                        fit: BoxFit.cover,
                      )),
                  cardDetails(),
                ],
              ));
        });
  }

  Widget cardDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 32.w, top: 18.h),
          child: Image.asset(
            '${AppImages.investmentimages}logo.png',
            height: 22.39.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: getLabel(earn_upto),
                fontsize: 11.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.blacktextcolor,
              ),
              sizeBoxWidth(6.w),
              AppText(
                text: '₹2000 ',
                fontsize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff339966),
              ),
              sizeBoxWidth(6.w),
              AppText(
                text: '+',
                fontsize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.blacktextcolor,
              ),
              sizeBoxWidth(6.w),
              Image.asset('${AppImages.creditcardimages}coin.png',
                  height: 16.5.h),
              sizeBoxWidth(6.w),
              AppText(
                text: '2000 finCoins',
                fontsize: 13.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xffFFA900),
              ),
            ],
          ),
        ),
        sizeBoxHeight(20.h),
        Padding(
          padding: EdgeInsets.only(left: 21.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'Fello >',
                fontsize: 14.5.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.blacktextcolor,
              ),
              sizeBoxHeight(12.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  children: [
                    Container(
                      height: 4.h,
                      width: 4.w,
                      decoration: BoxDecoration(
                          color: const Color(0xff6D6D6D),
                          borderRadius: BorderRadius.circular(30.r)),
                    ),
                    sizeBoxWidth(10.w),
                    AppText(
                      text: 'Earn 10% returns! Play games! Win rewards!',
                      fontsize: 12.5.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff3E3E3E),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        sizeBoxHeight(20.h),
        Padding(
          padding: EdgeInsets.only(left: 22.w, right: 22.w),
          child: Row(
            children: [
              Container(
                height: 38.92.h,
                width: 153.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(53.r),
                    border: Border.all(color: const Color(0xff1775D3))),
                child: Center(
                  child: AppText(
                    text: getLabel(add_customer),
                    fontsize: 13.5.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff1775D3),
                  ),
                ),
              ),
              sizeBoxWidth(10.w),
              Container(
                height: 38.92.h,
                width: 182.73.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(53.r),
                  color: const Color(0xff1775D3),
                ),
                child: Center(
                  child: AppText(
                    text: getLabel(share_with_customer),
                    fontsize: 13.5.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.whitecolor,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget listCard() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(bottom: 18.h),
              child: Stack(
                children: [
                  Container(
                      height: 335.h,
                      width: 390.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(31.3.r),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 3.r,
                              blurRadius: 3.r,
                              color: Colors.grey.shade100)
                        ],
                      ),
                      child: Image.asset(
                        '${AppImages.investmentimages}bigcard.png',
                        height: 335.h,
                        width: 390.w,
                        fit: BoxFit.fill,
                      )),
                  listDeails(),
                ],
              ));
        });
  }

  Widget listDeails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 31.w, top: 13.h),
          child: Image.asset(
            '${AppImages.investmentimages}mstock.png',
            height: 42.76.h,
          ),
        ),
        sizeBoxHeight(22.h),
        Padding(
          padding: EdgeInsets.only(left: 21.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: 'M stock Demat Account >',
                fontsize: 14.38.sp,
                fontWeight: FontWeight.bold,
                color: AppColor.blacktextcolor,
              ),
              sizeBoxHeight(12.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  children: [
                    Container(
                      height: 4.h,
                      width: 4.w,
                      decoration: BoxDecoration(
                          color: const Color(0xff6D6D6D),
                          borderRadius: BorderRadius.circular(30.r)),
                    ),
                    sizeBoxWidth(10.w),
                    AppText(
                      text: 'Zero Brokerage for lifetime with one time fee',
                      fontsize: 12.5.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff3E3E3E),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        sizeBoxHeight(27.h),
        Padding(
          padding: EdgeInsets.only(left: 21.w),
          child: SizedBox(
            height: 93.h,
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Image.asset(
                      '${AppImages.investmentimages}slidercard.png',
                      height: 93.h,
                    ),
                  );
                }),
          ),
        ),
        sizeBoxHeight(34.h),
        Padding(
          padding: EdgeInsets.only(left: 22.w, right: 22.w),
          child: Row(
            children: [
              Container(
                height: 38.92.h,
                width: 153.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(53.r),
                    border: Border.all(color: const Color(0xff1775D3))),
                child: Center(
                  child: AppText(
                    text: getLabel(add_customer),
                    fontsize: 13.5.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff1775D3),
                  ),
                ),
              ),
              sizeBoxWidth(10.w),
              Container(
                height: 38.92.h,
                width: 182.73.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(53.r),
                  color: const Color(0xff1775D3),
                ),
                child: Center(
                  child: AppText(
                    text: getLabel(share_with_customer),
                    fontsize: 13.5.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.whitecolor,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
