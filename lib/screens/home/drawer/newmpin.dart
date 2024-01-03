// ignore_for_file: use_build_context_synchronously, empty_catches

import 'package:finjoy_app/api/appLabel/app_label_service.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/screens/home/bottombar/home_screen.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../../../api/reset m pin/model/reset_mpin_model.dart';

enum TextfiledType {
  phonenum,
  email,
  allfiled,
  mintChocolateChip,
}

class NewMenuMPinScreen extends StatefulWidget {
  // final TextfiledType textfiledType;

  const NewMenuMPinScreen({
    super.key,
    // required this.textfiledType,
    // required this.emailId,
    // required this.phoneNum
  });
  // final String emailId;
  // final String phoneNum;

  @override
  State<NewMenuMPinScreen> createState() => _NewMenuMPinScreenState();
}

class _NewMenuMPinScreenState extends State<NewMenuMPinScreen> {
  TextEditingController firstPinController = TextEditingController();
  TextEditingController secondPinController = TextEditingController();
  FocusNode firstPinNode = FocusNode();
  FocusNode secondPinNode = FocusNode();
  String firstTestOtp = '';
  String secondTestOtp = '';
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isFirstOtpCompleted = false;
  String errorMessage = ''; // Declare a variable to hold the error message
  TextEditingController phoneController = TextEditingController();
  FocusNode phoneNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  FocusNode emailNode = FocusNode();

  TextEditingController fullnameController = TextEditingController();

  TextEditingController? editemailController;
  TextEditingController? editphoneController;

  final _repository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: SafeArea(
          child: Stack(children: [
            ScrollConfiguration(
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
                      sizeBoxHeight(40.h),
                      otpDetails(),
                      sizeBoxHeight(vDefaultPadding * 2),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: -40,
            //   left: 5,
            //   child: backArrow(),
            // ),
          ]),
        ),
      ),
    );
  }

  Widget otpImage() {
    return Column(
      children: [
        Image.asset('${AppImages.selectlanguageimages}logo.png', height: 50.h),
        sizeBoxHeight(30.h),
        Lottie.asset('${AppImages.entermpin}lock.json',
            height: MediaQuery.of(context).size.height / 5.h),
      ],
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
            EdgeInsets.only(top: 30.h, right: 21.w, left: 21.w, bottom: 37.h),
        child: Column(
          children: [
            AppText(
              text: getLabel(enter_new_m_pin),
              fontWeight: FontWeight.w500,
              fontsize: 22.sp,
              color: AppColor.blackcolor,
            ),
            sizeBoxHeight(43.h),
            otpFields(firstPinController, firstPinNode, (code) {
              firstTestOtp = code;
              setState(() {
                isFirstOtpCompleted = code.length == 4;
                errorMessage =
                    ''; // Clear error message when the user starts typing
              });
            }),
            sizeBoxHeight(27.h),
            AppText(
              text: getLabel(confirm_new_m_pin),
              fontWeight: FontWeight.w500,
              fontsize: 22.sp,
              color: AppColor.blackcolor,
            ),
            sizeBoxHeight(43.h),
            otpFields(secondPinController, secondPinNode, (code) {
              secondTestOtp = code;
              setState(() {
                isFirstOtpCompleted = code.length == 4;
                errorMessage =
                    ''; // Clear error message when the user starts typing
              });
            }),
            sizeBoxHeight(27.h),
            sizeBoxHeight(10.h),
            // resendOTP(),
            sizeBoxHeight(27.h),
            verifyButton(),
            // Display error message if not empty
            if (errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget backArrow() {
    return Padding(
      padding: EdgeInsets.only(left: 17.w, top: 52.h),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.5.r),
                  color: AppColor.bluecolor),
              child: Center(
                  child: Image.asset('${AppImages.sellearnimages}back.png',
                      height: 14.h)),
            ),
            sizeBoxWidth(12.w),
            AppText(
              text: '',
              fontsize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.blacktextcolor,
            ),
          ],
        ),
      ),
    );
  }

  Widget otpFields(TextEditingController controller, FocusNode node,
      ValueChanged<String> onChanged) {
    return Pinput(
      defaultPinTheme: defaultPinTheme,
      length: 4,
      controller: controller,
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
      listenForMultipleSmsOnAndroid: true,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      validator: emtermpinValidate,
      onCompleted: (String verificationCode) {},
      onChanged: onChanged,
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

  Widget resendOTP() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          text: getLabel(forgot_your_m_pin),
          fontWeight: FontWeight.w500,
          fontsize: 15.sp,
          color: AppColor.textgraycolor,
        ),
      ],
    );
  }

  Widget verifyButton() {
    return AppButton(
      color: AppColor.bluecolor,
      onPress: () {
        onResetMpin();
      },
      text: getLabel(set_new_m_pin),
    );
  }

  dynamic onResetMpin() async {
    try {
      Loader().showLoader(context);
      if (!mounted) return;
      final MyProfileResetMpinmodel isRestMpin = await _repository
          .ongetResetMPINApi(firstPinController.text, secondPinController.text);
      Loader().hideLoader(context);
      if (isRestMpin.success == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isRestMpin.message,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isRestMpin.message,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
      }
    } catch (e) {}
  }

// dynamic enterMPINCode() async {
//   Loader().showLoader(context);
//   final MPINModel ismpin = await _repository.onMPin(pinController.text);
//   Loader().hideLoader(context);
//   if (ismpin.success == true) {
//     Navigator.push(context, CupertinoPageRoute(
//       builder: (context) {
//         return const BottomBarPage();
//       },
//     ));
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       backgroundColor: AppColor.bluecolor,
//       content: AppText(
//         text: ismpin.message ?? '',
//         fontWeight: FontWeight.w600,
//         fontsize: 16.sp,
//         color: AppColor.whitecolor,
//       ),
//     ));
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       backgroundColor: AppColor.bluecolor,
//       content: AppText(
//         text: ismpin.message ?? '',
//         fontWeight: FontWeight.w600,
//         fontsize: 16.sp,
//         color: AppColor.whitecolor,
//       ),
//     ));
//     // if (ismpin.success == false) {
//     //
//     // }
//     // Loader().hideLoader(context);
//   }
// }
}
