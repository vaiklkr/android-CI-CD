// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:developer';

import 'package:finjoy_app/api/auth/model/register_email_id_model.dart';
import 'package:finjoy_app/api/auth/model/register_mobile_model.dart';
import 'package:finjoy_app/api/auth/model/sign_up_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/core/locale/language.dart';
import 'package:finjoy_app/screens/auth/otp_verifaction_screen.dart';
import 'package:finjoy_app/screens/auth/set_m_pin_screen.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../api/appLabel/app_label_service.dart';

enum TextfiledType {
  phonenum,
  email,
  allfiled,
  mintChocolateChip,
}

class SignUpScreen extends StatefulWidget {
  final TextfiledType textfiledType;

  const SignUpScreen(
      {super.key,
      required this.textfiledType,
      required this.emailId,
      required this.phoneNum,
      required this.refrral});
  final String emailId;
  final String phoneNum;
  final String refrral;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isverify = false;
  bool isverifyy = false;
  String? phoneNum;
  String? emailId;
  bool isChecked = false;

  final _repository = Repository();

  TextEditingController phoneController = TextEditingController();
  FocusNode phoneNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  FocusNode emailNode = FocusNode();

  TextEditingController fullnameController = TextEditingController();
  TextEditingController referralController = TextEditingController();

  TextEditingController? editemailController;
  TextEditingController? editphoneController;

  FocusNode editemailNode = FocusNode();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  // int? _value = 1;
  bool isEnternowClicked = false;
  bool shouldShowAppText = true;
  bool shouldShowAppTextFormField = false;
  String? _gender;

  @override
  Widget build(BuildContext context) {
    editemailController =
        TextEditingController(text: widget.emailId.toString());
    editphoneController =
        TextEditingController(text: widget.phoneNum.toString());
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: Form(
        key: _key,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              children: [
                backButton(context),
                ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: vDefaultPadding,
                            right: vDefaultPadding,
                            top: vDefaultPadding),
                        child: Column(
                          children: [
                            signUpImage(),
                            sizeBoxHeight(7.h),
                            signUpDetails(),
                            sizeBoxHeight(vDefaultPadding * 2),
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
      ),
    );
  }

  Widget signUpImage() {
    return Padding(
      padding:
          const EdgeInsets.only(left: vDefaultPadding, right: vDefaultPadding),
      child: Image.asset(
        '${AppImages.signupimages}signup.png',
        height: widget.textfiledType == TextfiledType.allfiled ? 190.h : 280.h,
      ),
    );
  }

  Widget signUpDetails() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: AppColor.whitecolor,
        boxShadow: [
          BoxShadow(
              spreadRadius: 3.r, blurRadius: 3.r, color: Colors.grey.shade100)
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 21.h, left: 23.w, right: 23.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Languages.of(context)!.signup,
              style: GoogleFonts.poppins(
                  color: AppColor.blackcolor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w500),
            ),
            sizeBoxHeight(16.h),
            Text(
              Languages.of(context)!.hello,
              style: GoogleFonts.poppins(
                  color: AppColor.textfieldtextcolor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            sizeBoxHeight(23.h),
            textfiled(),
          ],
        ),
      ),
    );
  }

  Widget textfiled() {
    return Column(
      children: [
        Column(
          children: [
            Visibility(
              visible: widget.textfiledType == TextfiledType.phonenum,
              child: AppTextFormField(
                validator: validatemobile,
                keyboardType: TextInputType.number,
                controller: phoneController,
                focusNode: phoneNode,
                label: getLabel(phone_number),
                textInputAction: TextInputAction.done,
                hint: '',
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 10,

              ),
            ),
            Visibility(
              visible: widget.textfiledType == TextfiledType.email,
              child: AppTextFormField(
                validator: validateEmail,
                controller: emailController,
                focusNode: emailNode,
                label: Languages.of(context)!.email,
                textInputAction: TextInputAction.done,
                hint: Languages.of(context)!.enemail,
              ),
            ),
            sizeBoxHeight(
                widget.textfiledType == TextfiledType.allfiled ? 0 : 160.h),
          ],
        ),
        Visibility(
            visible: widget.textfiledType == TextfiledType.allfiled,
            child: allTextfiled()),
        continueButton(),
        sizeBoxHeight(23.h),
      ],
    );
  }

  Widget allTextfiled() {
    return Column(
      children: [
        Container(
          color: AppColor.backgreencolor,
          child: AppTextFormField(
            controller: editphoneController,
            suffixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: AppColor.greencheckcolor,
                  ),
                  child: Icon(Icons.check,
                      color: AppColor.whitecolor, size: 18.sp),
                )),
            label: getLabel(phone_number),
            hint: getLabel(phone_number),
            readOnly: true,
          ),
        ),
        sizeBoxHeight(16.h),
        Container(
          color: AppColor.backgreencolor,
          child: AppTextFormField(
            readOnly: true,
            controller: editemailController,
            suffixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.r),
                    color: AppColor.greencheckcolor,
                  ),
                  child: Icon(Icons.check,
                      color: AppColor.whitecolor, size: 18.sp),
                )

                // Image.asset(
                //   '${AppImages.signupimages}verify.png',
                //   height: 25.h,
                // )

                ),
            label: getLabel(email_id),
            hint: getLabel(email_id),
          ),
        ),
        sizeBoxHeight(16.h),
        AppTextFormField(
          label: getLabel(enter_full_name),
          controller: fullnameController,
          validator: fullnameValidate,
          hint: '',
          keyboardType: TextInputType.text,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))],
        ),
        sizeBoxHeight(16.h),
        select(),
        sizeBoxHeight(32.h),
        Visibility(
          visible: shouldShowAppText,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: Languages.of(context)!.havean,
                fontWeight: FontWeight.w500,
                fontsize: 15.sp,
                color: AppColor.blacktextcolor,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    shouldShowAppTextFormField = !shouldShowAppTextFormField;
                    shouldShowAppText = !shouldShowAppText;
                  });
                },
                child: AppText(
                  text: Languages.of(context)!.enternow,
                  fontWeight: FontWeight.w500,
                  fontsize: 15.sp,
                  color: AppColor.bluecolor,
                ),
              ),
            ],
          ),
        ),
        sizeBoxHeight(12.h),
        Visibility(
          visible: shouldShowAppTextFormField,
          child: AppTextFormField(
            label: getLabel(enter_referral_code),
            controller: referralController,
            validator: referralValidate,
            hint: '',
            keyboardType: TextInputType.text,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
            ],
          ),
        ),
        sizeBoxHeight(33.h),
      ],
    );
  }

  Widget select() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffCFD3D4)),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
            const EdgeInsets.only(top: vDefaultSize, left: vDefaultPadding),
            child: Text(
              Languages.of(context)!.pleaseselect,
              style: GoogleFonts.poppins(
                  color: AppColor.blackkcolor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Radio(
                    fillColor:
                    const MaterialStatePropertyAll(AppColor.graycolor),
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  Text(
                    Languages.of(context)!.man,
                    style: GoogleFonts.poppins(
                        color: AppColor.blackkcolor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Row(
                children: [
                  Radio(
                    fillColor:
                    const MaterialStatePropertyAll(AppColor.graycolor),
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                  ),
                  Text(
                    Languages.of(context)!.woman,
                    style: GoogleFonts.poppins(
                        color: AppColor.blackkcolor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Radio(
                        fillColor:
                        const MaterialStatePropertyAll(AppColor.graycolor),
                        value: 'Prefer not to say',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                    ),
                    Text(
                      getLabel(prefer_not_to_say),
                      style: GoogleFonts.poppins(
                          color: AppColor.blackkcolor,
                          textStyle:
                          const TextStyle(overflow: TextOverflow.ellipsis),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  // Widget continueButton() {
  //   return AppButton(
  //     color: AppColor.bluecolor,
  //     onPress: () {
  //       if (_key.currentState!.validate()) {
  //         if (widget.textfiledType == TextfiledType.phonenum) {
  //           onRegisterMobileAPI();
  //         } else if (widget.textfiledType == TextfiledType.email) {
  //           onRegisterEmailIdAPI();
  //         } else {}
  //         if (widget.textfiledType == TextfiledType.allfiled) {
  //           onSignUpAPI();
  //         }
  //         widget.textfiledType == TextfiledType.allfiled
  //             ? Navigator.push(context, MaterialPageRoute(
  //                 builder: (context) {
  //                   return  SetMPinScreen(name: "", phoneNumber: '',);
  //                 },
  //               ))
  //             : Navigator.push(context, MaterialPageRoute(
  //                 builder: (context) {
  //                   return OTPVerifactionScreen(
  //                       phoneNum: widget.textfiledType == TextfiledType.phonenum
  //                           ? phoneController.text
  //                           : editphoneController?.text ?? '',
  //                       emailId: emailController.text,
  //                       textfiledType: widget.textfiledType);
  //                 },
  //               ));
  //       }
  //     },
  //     text: 'Sign Up',
  //   );
  // }

  // continueButton() async {
  //   bool success = false;
  //   if (widget.textfiledType == TextfiledType.phonenum) {
  //     success = await onRegisterMobileAPI();
  //   } else if (widget.textfiledType == TextfiledType.email) {
  //     success = await onRegisterEmailIdAPI();
  //   } else if (widget.textfiledType == TextfiledType.allfiled) {
  //     success = await onSignUpAPI();
  //   }

  //   if (success) {
  //     if (widget.textfiledType == TextfiledType.allfiled) {
  //       Navigator.pushReplacement(context, MaterialPageRoute(
  //         builder: (context) {
  //           return const SetMPinScreen();
  //         },
  //       ));
  //     } else {
  //       Navigator.pushReplacement(context, MaterialPageRoute(
  //         builder: (context) {
  //           return OTPVerifactionScreen(
  //             phoneNum: widget.textfiledType == TextfiledType.phonenum
  //                 ? phoneController.text
  //                 : editphoneController?.text ?? '',
  //             emailId: emailController.text,
  //             textfiledType: widget.textfiledType,
  //           );
  //         },
  //       ));
  //     }
  //   }
  // }

  Widget continueButton() {
    return AppButton(
      color: AppColor.bluecolor,
      onPress: () async {
        if (_key.currentState!.validate()) {
          bool success = false;

          if (widget.textfiledType == TextfiledType.phonenum) {
            success = await onRegisterMobileAPI();
          } else if (widget.textfiledType == TextfiledType.email) {
            success = await onRegisterEmailIdAPI();
          } else if (widget.textfiledType == TextfiledType.allfiled) {
            success = await onSignUpAPI();
          }

          if (success) {
            widget.textfiledType == TextfiledType.allfiled
                ? Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SetMPinScreen(
                          editphoneController: editphoneController!);
                    },
                  ))
                : Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return OTPVerifactionScreen(
                        phoneNum: widget.textfiledType == TextfiledType.phonenum
                            ? phoneController.text
                            : editphoneController?.text ?? '',
                        emailId: emailController.text,
                        textfiledType: widget.textfiledType,
                        refrral: widget.refrral,
                      );
                    },
                  ));
          } else {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   backgroundColor: AppColor.blackcolor,
            //   content: AppText(
            //     text: 'API call failed',
            //     fontWeight: FontWeight.w600,
            //     fontsize: 16.sp,
            //     color: AppColor.whitecolor,
            //   ),
            // ));
          }
        }
      },
      text: getLabel(sign_up),
    );
  }

  // ======================== REGISTER MOBILE NUMBER API=========================//

  Future<bool> onRegisterMobileAPI() async {
    Loader().showLoader(context);
    if (!mounted) return true;
    try {
      final RegisterMobileNumberModel isregistermobilenumber =
          await _repository.onRegistermobilenumber(phoneController.text);
      if (isregistermobilenumber.success == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: getLabel(please_enter_otp),
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
        return true;
      } else {
        if (isregistermobilenumber.success == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppColor.bluecolor,
            content: AppText(
              text: isregistermobilenumber.message ?? '',
              fontWeight: FontWeight.w600,
              fontsize: 16.sp,
              color: AppColor.whitecolor,
            ),
          ));
        }
        return false;
      }
    } finally {
      Loader().hideLoader(context);
    }
  }

// //======================== REGISTER MOBILE NUMBER API=========================//

//   Future<bool> onRegisterMobileAPI() async {
//     Loader().showLoader(context);

//     if (!mounted) return true;
//     final RegisterMobileNumberModel isregistermobilenumber =
//         await _repository.onRegistermobilenumber(phoneController.text);
//     if (isregistermobilenumber.success == true) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         backgroundColor: AppColor.bluecolor,
//         content: AppText(
//           text: 'Please enter OTP',
//           fontWeight: FontWeight.w600,
//           fontsize: 16.sp,
//           color: AppColor.whitecolor,
//         ),
//       ));
//       return true;
//       // Loader().showLoader(context);
//     } else {
//       Loader().hideLoader(context);
//       if (isregistermobilenumber.success == false) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           backgroundColor: AppColor.bluecolor,
//           content: AppText(
//             text: isregistermobilenumber.message ?? '',
//             fontWeight: FontWeight.w600,
//             fontsize: 16.sp,
//             color: AppColor.whitecolor,
//           ),
//         ));
//       }
//       return false;
//     }
//   }

// ========================== REGISTER EMAIL ID API ==========================//

  Future<bool> onRegisterEmailIdAPI() async {
    if (!mounted) return true;
    Loader().showLoader(context);
    try {
      final RegisterEmailIDModel isregisteremailid = await _repository
          .onRagisterEmailId(widget.phoneNum, emailController.text);

      if (isregisteremailid.success == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: getLabel(please_enter_otp),
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
        return true;
      } else {
        if (isregisteremailid.success == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppColor.bluecolor,
            content: AppText(
              text: isregisteremailid.message ?? '',
              fontWeight: FontWeight.w600,
              fontsize: 16.sp,
              color: AppColor.whitecolor,
            ),
          ));
        }
        return false;
      }
    } finally {
      Loader().hideLoader(context);
    }
  }
// //========================== REGISTER EMIAL ID API============================//

//   Future<bool> onRegisterEmailIdAPI() async {
//     if (!mounted) return true;
//     final RegisterEmailIDModel isregisteremailid = await _repository
//         .onRagisterEmailId(widget.phoneNum, emailController.text);
//     if (isregisteremailid.success == true) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         backgroundColor: AppColor.bluecolor,
//         content: AppText(
//           text: 'Please enter OTP',
//           fontWeight: FontWeight.w600,
//           fontsize: 16.sp,
//           color: AppColor.whitecolor,
//         ),
//       ));
//       return true;
//     } else {
//       if (isregisteremailid.success == false) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           backgroundColor: AppColor.bluecolor,
//           content: AppText(
//             text: isregisteremailid.message ?? '',
//             fontWeight: FontWeight.w600,
//             fontsize: 16.sp,
//             color: AppColor.whitecolor,
//           ),
//         ));
//       }
//       return false;
//     }
//   }

// =============================== SIGN UP API ===============================//



  Future<bool> onSignUpAPI() async {
    if (!mounted) return true;
    Loader().showLoader(context);
    try {
      final SignUpModel isSignUp = await _repository.onSignUp(
          widget.phoneNum,
          widget.emailId,
          fullnameController.text,
          _gender.toString(),
        referralController.text,
      );
      FocusScope.of(context).requestFocus(FocusNode());
      if (isSignUp.success == true) {
        log(referralController.text);
        PrefObj.preferences!.put(PrefKeys.DEVICETOKEN, isSignUp.data!.token);
        PrefObj.preferences!.put(PrefKeys.FullName, isSignUp.data!.name);
        PrefObj.preferences!.put(PrefKeys.MobileNumber, isSignUp.data!.mobileNumber);
        PrefObj.preferences!.put(PrefKeys.FinID, isSignUp.data!.finID);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isSignUp.message ?? '',
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
        return true;
      } else {
        if (isSignUp.success == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppColor.bluecolor,
            content: AppText(
              text: isSignUp.message ?? '',
              fontWeight: FontWeight.w600,
              fontsize: 16.sp,
              color: AppColor.whitecolor,
            ),
          ));
        }
        return false;
      }
    } finally {
      Loader().hideLoader(context);
    }
  }

  
// //=============================== SIGN UP API=================================//

//   Future<bool> onSignUpAPI() async {
//     if (!mounted) return true;
//     final SignUpModel isSignUp = await _repository.onSignUp(
//         widget.phoneNum, widget.emailId, fullnameController.text);

//     FocusScope.of(context).requestFocus(FocusNode());

//     if (isSignUp.success == true) {
//       PrefObj.preferences!.put(PrefKeys.DEVICETOKEN, isSignUp.data!.token);

//       log('================================${PrefObj.preferences!.get(PrefKeys.DEVICETOKEN)}');

//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         backgroundColor: AppColor.bluecolor,
//         content: AppText(
//           text: isSignUp.message ?? '',
//           fontWeight: FontWeight.w600,
//           fontsize: 16.sp,
//           color: AppColor.whitecolor,
//         ),
//       ));
//       return true;
//     } else {
//       if (isSignUp.success == false) {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           backgroundColor: AppColor.bluecolor,
//           content: AppText(
//             text: isSignUp.message ?? '',
//             fontWeight: FontWeight.w600,
//             fontsize: 16.sp,
//             color: AppColor.whitecolor,
//           ),
//         ));
//       }
//       return false;
//     }
//   }
}
