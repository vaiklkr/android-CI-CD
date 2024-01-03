// ignore_for_file: use_build_context_synchronously, empty_catches

import 'package:finjoy_app/api/appLabel/app_label_service.dart';
import 'package:finjoy_app/api/auth/model/set_m_pin_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/screens/profile/personal_information_screen.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class SetMPinScreen extends StatefulWidget {
  const SetMPinScreen({super.key, required this.editphoneController});

  final TextEditingController editphoneController;
  @override
  State<SetMPinScreen> createState() => _SetMPinScreenState();
}

class _SetMPinScreenState extends State<SetMPinScreen> {
  final _repository = Repository();

  TextEditingController mpinController = TextEditingController();

  TextEditingController reentermpinController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

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
              text: getLabel(set_m_pin),
              fontWeight: FontWeight.w500,
              fontsize: 24.sp,
              color: AppColor.blackcolor,
            ),
            sizeBoxHeight(5.h),
            AppText(
              text: getLabel(hello_welcome_and_get_started),
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
                    text: getLabel(enter_m_pin),
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
                  otpFields(reentermpinController, (value) {
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
            continueButton(),
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
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],

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
          label: getLabel(enter_m_pin),
          maxLength: 4,
          keyboardType: TextInputType.number,
          validator: emtermpinValidate,
          controller: mpinController,
          textInputAction: TextInputAction.next,
          hint: '',
        ),
        sizeBoxHeight(23.h),
        AppTextFormField(
          textInputAction: TextInputAction.done,
          controller: reentermpinController,
          maxLength: 4,
          keyboardType: TextInputType.number,
          label: getLabel(re_enter_m_pin),
          hint: '',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return getLabel(please_re_enter_m_pin);
            }
            if (value != mpinController.text) {
              return getLabel(passwords_do_not_match);
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget continueButton() {
    return AppButton(
        color: AppColor.bluecolor,
        onPress: () {
          if (_key.currentState!.validate()) {
            onSetMPinAPI();
          }
        },
        text: getLabel(txt_continue));
  }

  dynamic onSetMPinAPI() async {
    try {
      Loader().showLoader(context);
      if (!mounted) return;
      final SetMPinModel issetmpin = await _repository.onSetMPin(
        mpinController.text,
        reentermpinController.text,
      );
      Loader().hideLoader(context);
      if (issetmpin.success == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return PersonalInformationScreen(
                editphoneController: widget.editphoneController,
              );
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: issetmpin.message ?? '',
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: issetmpin.message ?? '',
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
      }
    } catch (e) {}
  }



// //============================= SET M PIN API ================================//

//   dynamic onSetMPinAPI() async {
//     if (!mounted) return;
//     final SetMPinModel issetmpin = await _repository.onSetMPin(
//         mpinController.text, reentermpinController.text);
//     if (issetmpin.success == true) {
//       Navigator.push(context, MaterialPageRoute(
//         builder: (context) {
//           return PersonalInformationScreen(
//               fullName: widget.fullName,
//               editphoneController: widget.editphoneController);
//         },
//       ));
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         backgroundColor: AppColor.bluecolor,
//         content: AppText(
//           text: issetmpin.message ?? '',
//           fontWeight: FontWeight.w600,
//           fontsize: 16.sp,
//           color: AppColor.whitecolor,
//         ),
//       ));
//     } else {
//       Loader().showLoader(context);
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         backgroundColor: AppColor.bluecolor,
//         content: AppText(
//           text: issetmpin.message ?? '',
//           fontWeight: FontWeight.w600,
//           fontsize: 16.sp,
//           color: AppColor.whitecolor,
//         ),
//       ));
//     }
//   }
}
