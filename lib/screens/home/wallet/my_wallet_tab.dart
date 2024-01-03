import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/notification/lead_related_screen.dart';
import 'package:finjoy_app/screens/home/wallet/transfer_amount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';
import 'balance_transfer_successfull.dart';

class MyWalletTab extends StatefulWidget {
  const MyWalletTab({super.key});

  @override
  State<MyWalletTab> createState() => _MyWalletTabState();
}

class _MyWalletTabState extends State<MyWalletTab> {
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
                cardDetails(),
                sizeBoxHeight(24.h),
                sendMoney(),
                sizeBoxHeight(24.h),
                dottedLine(),
                sizeBoxHeight(24.h),
                earningDetails(),
                sizeBoxHeight(24.h),
                withdrawalDetails(),
                sizeBoxHeight(24.h),
                dottedLine(),
                sizeBoxHeight(20.h),
              ],
            ),
          ),
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
                    text: getLabel(total_earning),
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
                    text: getLabel(balance),
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
            ],
          )
        ],
      ),
    );
  }

  Widget sendMoney() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                // return  const BalanceTransferSuccessFullyScreen();

                return const TransferAmountScreen();
              },
            ));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '${AppImages.walletimages}send.png',
                height: 48.h,
              ),
              sizeBoxHeight(15.h),
              AppText(
                text: getLabel(transfer_to_bank),
                fontsize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.bluecolor,
              ),
            ],
          ),
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Image.asset(
        //       '${AppImages.walletimages}moneysend.png',
        //       height: 48.h,
        //     ),
        //     sizeBoxHeight(15.h),
        //     AppText(
        //       text: getLabel(transfer_to_bank),
        //       fontsize: 13.sp,
        //       fontWeight: FontWeight.w500,
        //       color: AppColor.bluecolor,
        //     ),
        //   ],
        // ),
      ],
    );
  }

  Widget earningDetails() {
    return Column(
      children: [
        Container(
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
                        text: getLabel(earnings),
                        fontsize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.blackcolor,
                      ),
                    ),
                  ],
                ),
                sizeBoxHeight(25.h),
                Padding(
                  padding: EdgeInsets.only(left: 41.w, right: 41.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: getLabel(sales_earning),
                                fontsize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColor.bluecolor,
                              ),
                              sizeBoxHeight(15.h),
                              AppText(
                                text: getLabel(referral_earning),
                                fontsize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColor.bluecolor,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: '₹2000',
                                fontsize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blacktextcolor,
                              ),
                              sizeBoxHeight(15.h),
                              AppText(
                                text: '₹200',
                                fontsize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.blacktextcolor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      sizeBoxHeight(25.h),
                      dottedLine(),
                      sizeBoxHeight(15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            text: getLabel(total_earning),
                            fontsize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.bluecolor,
                          ),
                          AppText(
                            text: '₹2200',
                            fontsize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColor.blacktextcolor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget withdrawalDetails() {
    return Column(
      children: [
        Container(
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
                        text: getLabel(withdrawals),
                        fontsize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.blackcolor,
                      ),
                    ),
                  ],
                ),
                sizeBoxHeight(25.h),
                Padding(
                  padding: EdgeInsets.only(left: 41.w, right: 41.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: getLabel(total_withdrawal),
                                fontsize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                              sizeBoxHeight(15.h),
                              AppText(
                                text: '₹2000',
                                fontsize: 29.49.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColor.bluecolor,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: getLabel(last_withdrawal_date),
                                fontsize: 13.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                              sizeBoxHeight(15.h),
                              AppText(
                                text: '11/11/2022',
                                fontsize: 25.49.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     AppText(
                          //       text: getLabel(last_withdrawal_date),
                          //       fontsize: 13.sp,
                          //       fontWeight: FontWeight.bold,
                          //       color: AppColor.blackcolor,
                          //     ),
                          //     sizeBoxHeight(30.h),
                          //     AppText(
                          //       text: '11/11/2022',
                          //       fontsize: 13.sp,
                          //       fontWeight: FontWeight.w400,
                          //       color: AppColor.blacktextcolor,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                      sizeBoxHeight(25.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget resentDetails() {
    return Column(
      children: [
        Container(
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
                        text: getLabel(recent_transfer),
                        fontsize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColor.blackcolor,
                      ),
                    ),
                  ],
                ),
                sizeBoxHeight(25.h),
                Padding(
                  padding: EdgeInsets.only(left: 32.w, right: 32.w),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                '${AppImages.walletimages}netflix.png',
                                height: 39.h,
                              ),
                              sizeBoxWidth(15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: 'Netflix',
                                    fontsize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.blackcolor,
                                  ),
                                  AppText(
                                    text: 'Month subscription',
                                    fontsize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffBDBDBD),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AppText(
                            text: '\$12',
                            fontsize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.blackcolor,
                          ),
                        ],
                      ),
                      sizeBoxHeight(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                '${AppImages.walletimages}paypal.png',
                                height: 39.h,
                              ),
                              sizeBoxWidth(15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: 'Paypal',
                                    fontsize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.blackcolor,
                                  ),
                                  AppText(
                                    text: 'Tax',
                                    fontsize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffBDBDBD),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AppText(
                            text: '\$10',
                            fontsize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.blackcolor,
                          ),
                        ],
                      ),
                      sizeBoxHeight(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                '${AppImages.walletimages}paylater.png',
                                height: 39.h,
                              ),
                              sizeBoxWidth(15.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: 'Paylater',
                                    fontsize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.blackcolor,
                                  ),
                                  AppText(
                                    text: 'Buy item',
                                    fontsize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xffBDBDBD),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          AppText(
                            text: '\$2',
                            fontsize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.blackcolor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
