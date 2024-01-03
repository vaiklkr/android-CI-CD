// ignore_for_file: use_build_context_synchronously, unrelated_type_equality_checks

import 'dart:async';

import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/screens/auth/forgot_m_pin_screen.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../api/appLabel/app_label_service.dart';

class ForgotMPinOTPScreen extends StatefulWidget {
  const ForgotMPinOTPScreen({super.key, required this.phonenum});

  final String phonenum;

  @override
  State<ForgotMPinOTPScreen> createState() => _ForgotMPinOTPScreenState();
}

class _ForgotMPinOTPScreenState extends State<ForgotMPinOTPScreen> {
  TextEditingController pinController = TextEditingController();
  FocusNode pinNode = FocusNode();
  String testOtp = '';
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Timer? timers;
  int start = 10;
  bool isStop = false;

  final _repository = Repository();

  @override
  void initState() {
    startTimer();

    super.initState();
  }

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
                    otpImage(),
                    otpDetails(),
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

  Widget otpImage() {
    return Image.asset(
      '${AppImages.otpimages}otp.png',
      height: 350.h,
    );
  }

  Widget otpDetails() {
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
            EdgeInsets.only(top: 43.h, right: 21.w, left: 21.w, bottom: 37.h),
        child: Column(
          children: [
            AppText(
              text: getLabel(otp_verification),
              fontWeight: FontWeight.w500,
              fontsize: 18.sp,
              color: AppColor.blackcolor,
            ),
            sizeBoxHeight(15.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: getLabel(enter_the_otp_sent_to),
                  fontWeight: FontWeight.w400,
                  fontsize: 14.sp,
                  color: const Color(0xff4E4D4D),
                ),
                Flexible(
                  child: AppText(
                    text: ' : +${getLabel(txt_91)} ${widget.phonenum}',
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                    fontsize: 14.sp,
                    color: AppColor.blackcolor,
                  ),
                ),
              ],
            ),
            sizeBoxHeight(43.h),
            otpFields(),
            sizeBoxHeight(27.h),
            timeText(),
            sizeBoxHeight(27.h),
            resendOTP(),
            sizeBoxHeight(49.h),
            verifyButton()
          ],
        ),
      ),
    );
  }

  Widget otpFields() {
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      length: 4,
      controller: pinController,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      listenForMultipleSmsOnAndroid: true,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      validator: mobotpValidate,
      onCompleted: (String verificationCode) {},
      onChanged: (code) {
        testOtp = code;
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

  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 60;
  int currentSeconds = 0;
  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}:${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  startTimer([int? milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          isStop = true;
          timer.cancel();
        }
      });
    });
  }

  Widget timeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: timerText,
          fontWeight: FontWeight.w500,
          fontsize: 14.sp,
          color: AppColor.textgraycolor,
        ),
        AppText(
          text: ' ${getLabel(sec)}',
          fontWeight: FontWeight.w500,
          fontsize: 14.sp,
          color: AppColor.textgraycolor,
        ),
      ],
    );
  }

  Widget resendOTP() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: '${getLabel(don_t_receive_code)} ',
          fontWeight: FontWeight.w400,
          fontsize: 14.sp,
          color: AppColor.textgraycolor,
        ),
        GestureDetector(
          onTap: () {
            if (isStop) {
              start = 60;
              isStop = false;
              startTimer();
              setState(() {});
            }
          },
          child: AppText(
            text: getLabel(re_send),
            fontWeight: FontWeight.w600,
            fontsize: 14.sp,
            color: !isStop ? AppColor.graycolor : AppColor.blackcolor,
          ),
        ),
      ],
    );
  }

  Widget verifyButton() {
    return AppButton(
        color: AppColor.bluecolor,
        onPress: () {
          if (_key.currentState!.validate()) {
            verifyOTPtoResetMPinCode();
          }
        },
        text: getLabel(verify));
  }

  dynamic verifyOTPtoResetMPinCode() async {
    Loader().showLoader(context);
    final dynamic isverifytoresetMPin = await _repository
        .onVerifyOTPtoResetMPin(widget.phonenum, pinController.text);
    if (isverifytoresetMPin.message == 'OTP verified successfully') {
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) {
          return ForgotMPinScreen(phoneNum: widget.phonenum);
        },
      ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.bluecolor,
        content: AppText(
          text: isverifytoresetMPin.message.toString(),
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: AppText(
          text: isverifytoresetMPin.message.toString(),
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
      Loader().hideLoader(context);
    }
  }
}
