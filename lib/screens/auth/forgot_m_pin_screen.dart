// ignore_for_file: use_build_context_synchronously

import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/screens/auth/login_screen.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../api/appLabel/app_label_service.dart';

class ForgotMPinScreen extends StatefulWidget {
  const ForgotMPinScreen({super.key, required this.phoneNum});
  final String phoneNum;
  @override
  State<ForgotMPinScreen> createState() => _ForgotMPinScreenState();
}

class _ForgotMPinScreenState extends State<ForgotMPinScreen> {
  TextEditingController mpinController = TextEditingController();
  TextEditingController confirmmpinController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: Form(
        key: _key,
        child: SafeArea(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: vDefaultPadding,
                    right: vDefaultPadding,
                    top: vDefaultPadding * 2),
                child: Column(
                  children: [
                    forgotImage(),
                    sizeBoxHeight(vDefaultPadding * 3),
                    forgotmDetails(),
                    sizeBoxHeight(vDefaultPadding * 2),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget forgotImage() {
    return Image.asset(
      '${AppImages.forgotmpinimages}forgot.png',
      height: 333.h,
    );
  }

  Widget forgotmDetails() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.whitecolor,
        boxShadow: [
          BoxShadow(
              spreadRadius: 3.r, blurRadius: 3.r, color: Colors.grey.shade100),
        ],
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 21.h, right: 23.w, left: 23.w, bottom: 35.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: getLabel(reset_m_pin),
              fontWeight: FontWeight.w500,
              fontsize: 24.sp,
              color: AppColor.blackcolor,
            ),
            sizeBoxHeight(5.h),
            AppText(
              text: getLabel(please_enter_new_m_pin_to_access_app),
              fontWeight: FontWeight.w500,
              fontsize: 14.sp,
              color: AppColor.textfieldtextcolor,
            ),
            sizeBoxHeight(23.h),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: getLabel(re_enter_m_pin),
                    fontWeight: FontWeight.w500,
                    fontsize: 14.sp,
                    color: AppColor.textfieldtextcolor,
                  ),
                  sizeBoxHeight(10.h),
                  otpFields(mpinController, emtermpinValidate),
                  sizeBoxHeight(23.h),
                  AppText(
                    text: getLabel(please_re_enter_m_pin),
                    fontWeight: FontWeight.w500,
                    fontsize: 14.sp,
                    color: AppColor.textfieldtextcolor,
                  ),
                  sizeBoxHeight(10.h),
                  otpFields(confirmmpinController, (value) {
                    if (value == null || value.isEmpty) {
                      return getLabel(please_re_enter_m_pin);
                    }
                    if (value != mpinController.text) {
                      return getLabel(m_pindo_not_match);
                    }
                    return null;
                  }),
                ],
              ),
            ),
            sizeBoxHeight(30.h),
            setNewButton(),
          ],
        ),
      ),
    );
  }

  Widget otpFields(pinController, String? Function(String? value) emtermpinValidate) {
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      length: 4,
      controller: pinController,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      listenForMultipleSmsOnAndroid: true,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      validator: emtermpinValidate,
      onCompleted: (String verificationCode) {},
      onChanged: (code) {
        // testOtp = code;
        setState(() {});
      },
    );
  }

  final defaultPinTheme = PinTheme(
    height: 58.h,
    width: 58.w,
    textStyle: const TextStyle(
        fontSize: 20, color: AppColor.blackcolor, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 5,
          color: Colors.grey.shade300,
        ),
        BoxShadow(
          offset: const Offset(1, 2),
          blurRadius: 5,
          spreadRadius: 2,
          color: Colors.grey.shade300,
        ),
      ],
      color: const Color(0xffF6F6F6),
      borderRadius: BorderRadius.circular(8.r),
    ),
  );

  Widget textfiled() {
    return Column(
      children: [
        AppTextFormField(
          keyboardType: TextInputType.number,
          label: getLabel(re_enter_m_pin),
          validator: emtermpinValidate,
          controller: mpinController,
          textInputAction: TextInputAction.next,
          maxLength: 4,
          hint: '',
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        sizeBoxHeight(23.h),
        AppTextFormField(
          keyboardType: TextInputType.number,
          controller: confirmmpinController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return getLabel(please_re_enter_m_pin);
            }
            if (value != mpinController.text) {
              return getLabel(m_pindo_not_match);
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          maxLength: 4,
          label: getLabel(re_enter_m_pin),
          hint: '',
        ),
      ],
    );
  }

  Widget setNewButton() {
    return AppButton(
        color: AppColor.bluecolor,
        onPress: () {
          if (_key.currentState!.validate()) {
            resetMPinCode();
          }
        },
        text: getLabel(reset_m_pin));
  }

  dynamic resetMPinCode() async {
    Loader().showLoader(context);
    final dynamic isresetMPin = await _repository.onResetMPin(
        mpinController.text, confirmmpinController.text, widget.phoneNum);
    if (isresetMPin.message == 'MPin reset successfully') {
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.bluecolor,
        content: AppText(
          text: isresetMPin.message.toString(),
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: AppText(
          text: isresetMPin.message.toString(),
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
      Loader().hideLoader(context);
    }
  }
}
