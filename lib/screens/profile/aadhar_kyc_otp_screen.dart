// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:finjoy_app/api/kyc/model/validate_aadhaar_otp_model.dart';
import 'package:finjoy_app/api/kyc/model/verify_aadhaar_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/profile/kyc_success_screen.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../api/appLabel/app_label_service.dart';

class AadharKYCOTPScreen extends StatefulWidget {
  final void Function(bool) onClose;
  AadharKYCOTPScreen({
    super.key,
    required this.aadharNum,
    required this.data,
    required this.onClose,
  });
  String? aadharNum;
  VerifyAadhaarData? data;

  @override
  State<AadharKYCOTPScreen> createState() => _AadharKYCOTPScreenState();
}

class _AadharKYCOTPScreenState extends State<AadharKYCOTPScreen> {
  TextEditingController pinController = TextEditingController();
  final _repository = Repository();

  FocusNode pinNode = FocusNode();
  String testOtp = '';

  Timer? timers;
  int start = 10;
  bool isStop = false;
  @override
  void initState() {
    startTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: SafeArea(
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
                    text: ' : ${getLabel(aadhar_register_number)}',
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
      length: 6,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: pinController,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      listenForMultipleSmsOnAndroid: true,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
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
            color: Colors.grey.shade300),
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
              onVerifyAadharOTPAPI(widget.data);
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
          onVerifyAadharOTPAPI(widget.data);
        },
        text: getLabel(verify));
  }

  Future<bool> onVerifyAadharOTPAPI(VerifyAadhaarData? data) async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final VerifyAadharOTPModel isverifyCaptcha =
        await _repository.onVerifyAadharOTP(widget.aadharNum.toString(),
            data?.sessionid ?? '', data?.referenceId ?? '', pinController.text);
    Loader().hideLoader(context);
    if (isverifyCaptcha.success == true) {
      final player = AudioPlayer();
      player.play(AssetSource('sound_success.wav'));
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return KYCSuccessfullyScreen(
            onClose: (value) {
              widget.onClose(value);
              setState(() {});
            },
          );
        },
      ));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.bluecolor,
        content: AppText(
          text: isverifyCaptcha.message ?? '',
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
      return true;
    } else {
      if (isverifyCaptcha.success == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isverifyCaptcha.message ?? '',
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
