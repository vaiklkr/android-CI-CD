// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:finjoy_app/api/auth/model/login_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/screens/auth/forgot_m_pin_mobile_screen.dart';
import 'package:finjoy_app/screens/auth/sign_up_screen.dart';
import 'package:finjoy_app/screens/profile/my_profile_screen.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_bottom_bar.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api/appLabel/app_label_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _repository = Repository();

  TextEditingController phonenumberController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Form(
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
                      loginImage(),
                      sizeBoxHeight(8.h),
                      loginDetails(),
                      sizeBoxHeight(vDefaultPadding * 2),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginImage() {
    return Image.asset(
      '${AppImages.loginimages}login.png',
      height: 280.h,
    );
  }

  Widget loginDetails() {
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
        padding: EdgeInsets.only(top: 21.h, right: 23.w, left: 23.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: getLabel(login),
              fontWeight: FontWeight.w500,
              fontsize: 24.sp,
              color: AppColor.blackcolor,
            ),
            sizeBoxHeight(16.h),
            AppText(
              text: getLabel(hello_welcome_to_finjoy),
              fontWeight: FontWeight.w500,
              fontsize: 16.sp,
              color: AppColor.textfieldtextcolor,
            ),
            sizeBoxHeight(23.h),
            textfiled(),
            sizeBoxHeight(8.h),
            forgotPass(),
            sizeBoxHeight(24.h),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget textfiled() {
    return Column(
      children: [
        AppTextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          maxLength: 10,
          textInputAction: TextInputAction.next,
          label: getLabel(phone_number),
          validator: validateMobile,
          controller: phonenumberController,
          hint: '',
        ),
        sizeBoxHeight(23.h),
        AppTextFormField(
          label: getLabel(enter_m_pin),
          hint: '',
          obscureText: _obscureText,
          controller: pinController,
          validator: emtermpinValidate,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          maxLength: 4,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget forgotPass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                return ForgotMPinMobileScreen(phonenum: phonenumberController);
              },
            ));
          },
          child: AppText(
            text: getLabel(forgot_m_pin),
            fontWeight: FontWeight.w500,
            fontsize: 14.sp,
            color: AppColor.graytextcolor,
          ),
        )
      ],
    );
  }

  Widget loginButton() {
    return Column(
      children: [
        AppButton(
            color: AppColor.bluecolor,
            onPress: () {
              if (_key.currentState!.validate()) {
                onLoginAPI();
              }
            },
            text: getLabel(login)),
        sizeBoxHeight(22.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: '${getLabel(new_on_platform)} ',
              fontWeight: FontWeight.w600,
              fontsize: 16.sp,
              color: AppColor.blacktextcolor,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const SignUpScreen(
                      phoneNum: '',
                      emailId: '',
                      textfiledType: TextfiledType.phonenum, refrral: '',
                    );
                  },
                ));
              },
              child: AppText(
                text: getLabel(register_now),
                fontWeight: FontWeight.w600,
                fontsize: 16.sp,
                color: AppColor.bluecolor,
              ),
            ),
          ],
        ),
        sizeBoxHeight(22.h),
      ],
    );
  }

  Future<bool> onLoginAPI() async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final LoginModel islogin = await _repository.onLogin(
        phonenumberController.text, pinController.text);
    if (islogin.success == true) {
      PrefObj.preferences?.put(PrefKeys.isLogout, false);
      PrefObj.preferences!.put(PrefKeys.DEVICETOKEN, islogin.data!.token);
      PrefObj.preferences!.put(PrefKeys.FullName, islogin.data!.name);
      PrefObj.preferences!.put(PrefKeys.ProfileImage, islogin.data!.iconURL!.isEmpty ? ''/*'${AppImages.profileimages}profile.png'*/ : islogin.data!.iconURL);
      PrefObj.preferences!
          .put(PrefKeys.MobileNumber, islogin.data!.mobileNumber);
      PrefObj.preferences!.put(PrefKeys.FinID, islogin.data!.finID);

      bool isLogout = PrefObj.preferences!.get(PrefKeys.isLogout);

      if (isLogout) {
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) {
            return const BottomBarPage();
          },
        ));
      } else {
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) {
            return const MyProfileScreen(
              navigate: BackNavigatorType.myprofile,
            );
          },
        ));
      }

      // Fluttertoast.showToast(
      //     msg: islogin.message ?? '',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: AppColor.bluecolor,
      //     textColor: Colors.white,
      //     fontSize: 16.0);

      // Get.snackbar(
      //   "",
      //   "",
      //   titleText: Padding(
      //     padding: const EdgeInsets.only(top: 5.0, left: 10.0),
      //     child: AppText(
      //         text: islogin.message ?? '',
      //         fontWeight: FontWeight.w600,
      //         fontsize: 16.sp,
      //         color: AppColor.whitecolor),
      //   ),
      //   backgroundColor: AppColor.bluecolor,
      //   borderRadius: 0,
      //   padding: const EdgeInsets.all(1),
      //   margin: const EdgeInsets.all(1),
      //   duration: const Duration(seconds: 3),
      //   isDismissible: true,
      //   forwardAnimationCurve: Curves.easeOutBack,
      //   colorText: AppColor.whitecolor,
      //   snackPosition: SnackPosition.BOTTOM,
      // );
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColor.bluecolor,
      // content: AppText(
      //   text: islogin.message ?? '',
      //   fontWeight: FontWeight.w600,
      //   fontsize: 16.sp,
      //   color: AppColor.whitecolor,
      // ),
      // ));
      return true;
    } else {
      Loader().hideLoader(context);
      if (islogin.success == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: islogin.message ?? '',
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
