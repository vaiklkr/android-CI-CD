import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/bottombar/home_screen.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/appLabel/app_label_service.dart';

class KYCSuccessfullyScreen extends StatefulWidget {
  final void Function(bool) onClose;
  const KYCSuccessfullyScreen({super.key, required this.onClose,});

  @override
  State<KYCSuccessfullyScreen> createState() => _KYCSuccessfullyScreenState();
}

class _KYCSuccessfullyScreenState extends State<KYCSuccessfullyScreen> {
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
        AppText(
          text: getLabel(ekyc__successfully_verified),
          fontWeight: FontWeight.w500,
          fontsize: 20.sp,
          color: AppColor.blackcolor,
        ),
        sizeBoxHeight(vDefaultPadding * 4),
        AppButton(
            color: AppColor.bluecolor,
            onPress: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);

              widget.onClose(true);

              Navigator.push(context, CupertinoPageRoute(
                builder: (context) {
                  return const HomeScreen();
                },
              ));
            },
            text: getLabel(txt_continue)),
      ],
    );
  }
}

class BankDetailsSuccessfullyScreen extends StatefulWidget {
  final void Function(bool) onClose;

  const BankDetailsSuccessfullyScreen({super.key, required this.onClose});

  @override
  State<BankDetailsSuccessfullyScreen> createState() =>
      _BankDetailsSuccessfullyScreenScreenState();
}

class _BankDetailsSuccessfullyScreenScreenState
    extends State<BankDetailsSuccessfullyScreen> {
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
        AppText(
          text: getLabel(bank_details_verified_successfully),
          fontWeight: FontWeight.w500,
          fontsize: 20.sp,
          color: AppColor.blackcolor,
        ),
        sizeBoxHeight(vDefaultPadding * 4),
        AppButton(
            color: AppColor.bluecolor,
            onPress: () {
              Navigator.pop(context);
              Navigator.pop(context);

              widget.onClose(true);
              // Navigator.push(context, CupertinoPageRoute(
              //   builder: (context) {
              //     return

              //     MyProfileScreen(
              //         fullName: '',
              //         editphoneController: TextEditingController(text: ''));
              //   },
              // ));
            },
            text: getLabel(txt_continue)),
      ],
    );
  }
}
