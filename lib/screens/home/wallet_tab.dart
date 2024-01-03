import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/wallet/history_tab.dart';
import 'package:finjoy_app/screens/home/wallet/my_wallet_screen.dart';
import 'package:finjoy_app/screens/home/wallet/transfer_amount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/appLabel/app_label_service.dart';

class WalletTab extends StatefulWidget {
  const WalletTab({super.key});

  @override
  State<WalletTab> createState() => _WalletTabState();
}

class _WalletTabState extends State<WalletTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whitecolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          cardDetails(),
          sizeBoxHeight(vDefaultPadding * 2.h),
          sendMoney()        ],
      ),
    );
  }

  Widget cardDetails() {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
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
                    text: "Balance",
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

  // Widget walletButton() {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.push(context, CupertinoPageRoute(
  //         builder: (context) {
  //           return const MyWalletScreen();
  //         },
  //       ));
  //     },
  //     child: Container(
  //       height: 65.h,
  //       width: 201.w,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(15.r),
  //         color: AppColor.bluecolor,
  //       ),
  //       child: Center(
  //         child: AppText(
  //           text: getLabel(details),
  //           fontsize: 20.sp,
  //           fontWeight: FontWeight.w500,
  //           color: AppColor.whitecolor,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget sendMoney() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                // return  const BalanceTransferSuccessFullyScreen();

                return MyWalletScreen(tabIndex: 0,);
              },
            ));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height:48.h,
                child: Image.asset(
                  '${AppImages.walletimages}bank.png',
                  height: 30.h,
                  width: 30.w,
                  color: Colors.black,
                ),
              ),
              sizeBoxHeight(15.h),
              AppText(
                text: getLabel(go_to_details),
                fontsize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.bluecolor,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                // return  const BalanceTransferSuccessFullyScreen();

                return MyWalletScreen(tabIndex: 1,);
              },
            ));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                '${AppImages.walletimages}moneysend.png',
                height: 48.h,
              ),
              sizeBoxHeight(15.h),
              AppText(
                text: getLabel(history),
                fontsize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColor.bluecolor,
              ),
            ],
          ),
        ),
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
      ],
    );
  }
}
