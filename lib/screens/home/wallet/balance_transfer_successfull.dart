


import 'package:finjoy_app/screens/home/bottombar/home_screen.dart';
import 'package:finjoy_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../api/appLabel/app_label_service.dart';
import '../../../core/app_color.dart';
import '../../../core/app_image.dart';
import '../../../core/app_sized_box.dart';
import '../../../core/app_text.dart';
import '../../../widgets/custom_button.dart';
import '../../profile/my_profile_screen.dart';

class BalanceTransferSuccessFullyScreen extends StatefulWidget {


  const BalanceTransferSuccessFullyScreen({super.key, });

  @override
  State<BalanceTransferSuccessFullyScreen> createState() => _BalanceTransferSuccessFullyScreenState();
}

class _BalanceTransferSuccessFullyScreenState extends State<BalanceTransferSuccessFullyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: vDefaultPadding,
              right: vDefaultPadding,
              top: vDefaultPadding),
          child: Column(
            children: [
              kycSuccessImage(),
              sizeBoxHeight(57.h),
              doneImage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget kycSuccessImage() {
    return Image.asset(
      '${AppImages.kycsucessimages}kyc.png',
      height: 372.h,
    );
  }

  Widget doneImage() {
    return Column(
      children: [
        Image.asset(
          '${AppImages.kycsucessimages}done.png',
          height: 80.h,
        ),
        sizeBoxHeight(57.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: getLabel(sent_successfully_to_your_bank_account),
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              color: AppColor.blackcolor,
            ),
          ],
        ),
        sizeBoxHeight(20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: 'Reference no. FJ243243932432',
              fontWeight: FontWeight.w200,
              fontsize: 13.sp,
              color: AppColor.blackcolor,
            ),
          ],
        ),
        sizeBoxHeight(vDefaultPadding * 4),
        AppButton(
            color: AppColor.bluecolor,
            onPress: () {
              // Navigator.pop(context);
              // Navigator.pop(context);

              // widget.onClose(true);
              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return const BottomBarPage();
                },
              ));
            },
            text: getLabel(done)),
      ],
    );
  }
}
