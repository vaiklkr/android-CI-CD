// ignore_for_file: use_build_context_synchronously

import 'package:finjoy_app/api/auth/model/otp_to_reset_mpin_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/screens/auth/forgot_m_pin_otp_screen.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/appLabel/app_label_service.dart';

class ForgotMPinMobileScreen extends StatefulWidget {
  const ForgotMPinMobileScreen({super.key, this.phonenum});

  final TextEditingController? phonenum;
  @override
  State<ForgotMPinMobileScreen> createState() => _ForgotMPinMobileScreenState();
}

class _ForgotMPinMobileScreenState extends State<ForgotMPinMobileScreen> {
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneNode = FocusNode();
  final _repository = Repository();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: Form(
        key: _key,
        child: SafeArea(
          child: Column(
            children: [
              backButton(context),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: vDefaultPadding,
                          right: vDefaultPadding,
                          top: vDefaultPadding),
                      child: Column(
                        children: [
                          signUpImage(),
                          sizeBoxHeight(20.h),
                          mobilenumDetails(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget signUpImage() {
    return Padding(
      padding:
          const EdgeInsets.only(left: vDefaultPadding, right: vDefaultPadding),
      child: Image.asset(
        '${AppImages.signupimages}signup.png',
        height: 280.h,
      ),
    );
  }

  Widget mobilenumDetails() {
    return Container(
      height: 450.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColor.whitecolor,
          boxShadow: [
            BoxShadow(
                spreadRadius: 3.r, blurRadius: 3.r, color: Colors.grey.shade100)
          ]),
      child: Padding(
        padding:
            EdgeInsets.only(top: 21.h, left: 23.w, right: 23.w, bottom: 23.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    text: getLabel(enter_mobile_number),
                    color: AppColor.blackcolor,
                    fontsize: 24.sp,
                    fontWeight: FontWeight.w500),
                sizeBoxHeight(20.h),
                AppTextFormField(
                  validator: validatemobile,
                  keyboardType: TextInputType.number,
                  // controller: widget.phonenum,

                  controller: widget.phonenum ?? phoneController,
                  maxLength: 10,
                  label: getLabel(phone_number),
                  textInputAction: TextInputAction.done,
                  hint: '',
                ),
              ],
            ),
            const Spacer(),
            AppButton(
              color: AppColor.bluecolor,
              onPress: () {
                if (_key.currentState!.validate()) {
                  onOTPToResetMPinAPI();
                }
              },
              text: getLabel(txt_continue),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> onOTPToResetMPinAPI() async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final OTPToResetMPINModel isotptoresetmpin =
        await _repository.onOTPToResetMPin(widget.phonenum == null
            ? phoneController.text
            : widget.phonenum!.text);

    if (isotptoresetmpin.success == true) {
      Loader().hideLoader(context);
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) {
          return ForgotMPinOTPScreen(
              phonenum: widget.phonenum == null
                  ? phoneController.text
                  : widget.phonenum!.text);
        },
      ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.bluecolor,
        content: AppText(
          text: isotptoresetmpin.message ?? '',
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
      return true;
    } else {
      Loader().hideLoader(context);
      if (isotptoresetmpin.success == false) {
        print("Failed");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isotptoresetmpin.message ?? '',
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
      }
      return false;
    }
  }
}
