// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'package:finjoy_app/api/appLabel/app_label_service.dart';
import 'package:finjoy_app/api/auth/model/m_pin_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/screens/auth/forgot_m_pin_mobile_screen.dart';
import 'package:finjoy_app/screens/auth/login_screen.dart';
import 'package:finjoy_app/screens/home/credit%20card/credit_card_details_screen.dart';
import 'package:finjoy_app/screens/profile/my_profile_screen.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_bottom_bar.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';

import '../../main.dart';

class EnterMPinScreen extends StatefulWidget {
  final String fullname;

  const EnterMPinScreen({super.key, required this.fullname});
  @override
  State<EnterMPinScreen> createState() => _EnterMPinScreenState();
}

class _EnterMPinScreenState extends State<EnterMPinScreen> {
  TextEditingController pinController = TextEditingController();
  FocusNode pinNode = FocusNode();
  String testOtp = '';
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final _repository = Repository();
  int failedAttempts = 0;
  int maxAttempts = 5;


  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    // auth.isDeviceSupported().then(
    //       (bool isSupported) => setState(() => _supportState = isSupported
    //       ? _SupportState.supported
    //       : _SupportState.unsupported),
    // );
    // setState(() {
    //   systemLockPopup();
    // });
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      /*if (_supportState != _SupportState.supported) {
        return;
      }*/
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    setState(() {
      if (authenticated) {
        goToNext();
      }
    });

    setState(
            () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason:
        'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Plugin example app'),
  //       ),
  //       body: ListView(
  //         padding: const EdgeInsets.only(top: 30),
  //         children: <Widget>[
  //           Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               if (_supportState == _SupportState.unknown)
  //                 const CircularProgressIndicator()
  //               else if (_supportState == _SupportState.supported)
  //                 const Text('This device is supported')
  //               else
  //                 const Text('This device is not supported'),
  //               const Divider(height: 100),
  //               Text('Can check biometrics: $_canCheckBiometrics\n'),
  //               ElevatedButton(
  //                 onPressed: _checkBiometrics,
  //                 child: const Text('Check biometrics'),
  //               ),
  //               const Divider(height: 100),
  //               Text('Available biometrics: $_availableBiometrics\n'),
  //               ElevatedButton(
  //                 onPressed: _getAvailableBiometrics,
  //                 child: const Text('Get available biometrics'),
  //               ),
  //               const Divider(height: 100),
  //               Text('Current State: $_authorized\n'),
  //               if (_isAuthenticating)
  //                 ElevatedButton(
  //                   onPressed: _cancelAuthentication,
  //                   child: const Row(
  //                     mainAxisSize: MainAxisSize.min,
  //                     children: <Widget>[
  //                       Text('Cancel Authentication'),
  //                       Icon(Icons.cancel),
  //                     ],
  //                   ),
  //                 )
  //               else
  //                 Column(
  //                   children: <Widget>[
  //                     ElevatedButton(
  //                       onPressed: _authenticate,
  //                       child: const Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: <Widget>[
  //                           Text('Authenticate'),
  //                           Icon(Icons.perm_device_information),
  //                         ],
  //                       ),
  //                     ),
  //                     ElevatedButton(
  //                       onPressed: _authenticateWithBiometrics,
  //                       child: Row(
  //                         mainAxisSize: MainAxisSize.min,
  //                         children: <Widget>[
  //                           Text(_isAuthenticating
  //                               ? 'Cancel'
  //                               : 'Authenticate: biometrics only'),
  //                           const Icon(Icons.fingerprint),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    sizeBoxHeight(40.h),
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

  // void systemLockPopup() {
  //   print('call ================> ');
  //   // if (_supportState == _SupportState.supported/* && _canCheckBiometrics! && _availableBiometrics!.isNotEmpty*/) {
  //     _authenticate;
  //   // }
  // }

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
              text:
                  '${getLabel(welcome)}, ${PrefObj.preferences!.get(PrefKeys.FullName) ?? ''}',
              fontWeight: FontWeight.w400,
              fontsize: 15.sp,
              color: AppColor.blackcolor,
            ),
            sizeBoxHeight(10.h),
            AppText(
              text: getLabel(enter_m_pin),
              fontWeight: FontWeight.w500,
              fontsize: 22.sp,
              color: AppColor.blackcolor,
            ),
            sizeBoxHeight(43.h),
            otpFields(),
            sizeBoxHeight(27.h),
            sizeBoxHeight(10.h),
            resendOTP(),
            sizeBoxHeight(60.h),
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
      validator: emtermpinValidate,
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

  Widget resendOTP() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) {
            return const ForgotMPinMobileScreen();
          },
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: getLabel(forgot_your_m_pin),
            fontWeight: FontWeight.w500,
            fontsize: 15.sp,
            color: AppColor.textgraycolor,
          ),
        ],
      ),
    );
  }

  Widget verifyButton() {
    return AppButton(
        color: AppColor.bluecolor,
        onPress: () {
          // _authenticate;
          if (_key.currentState!.validate()) {
            enterMPINCode();
          }
        },
        text: getLabel(confirm));
  }

  dynamic goToNext() {
    bool isKYC = PrefObj.preferences?.get(PrefKeys.isKYC) ?? false;
    bool isBank = PrefObj.preferences?.get(PrefKeys.isBank) ?? false;
    if (isKYC && isBank) {
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) {
          return const BottomBarPage();
        },
      ));
    } else {
      bool isLogout = PrefObj.preferences?.get(PrefKeys.isLogout) ?? false;

      if (isLogout) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (context) => const LoginScreen()),
                (Route<dynamic> route) => false);
      } else {
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) {
            return const MyProfileScreen(
              navigate: BackNavigatorType.myprofile,
            );
          },
        ));
      }
    }
  }

  dynamic enterMPINCode() async {
    Loader().showLoader(context);
    final MPinModel ismpin = await _repository.onMPin(pinController.text);
    Loader().hideLoader(context);
    if (ismpin.success == true) {
      goToNext();

      // Fluttertoast.showToast(
      //     msg: ismpin.message ?? '',
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: AppColor.bluecolor,
      //     textColor: Colors.white,
      //     fontSize: 16.0);

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColor.bluecolor,
      //   content: AppText(
      //     text: ismpin.message ?? '',
      //     fontWeight: FontWeight.w600,
      //     fontsize: 16.sp,
      //     color: AppColor.whitecolor,
      //   ),
      // ));

      // );
    } else {
      failedAttempts++;

      if (failedAttempts >= maxAttempts) {
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) {
            return const ForgotMPinMobileScreen();
          },
        ));
      } else {
        int attemptsRemaining = maxAttempts - failedAttempts;

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text:
                '${ismpin.message ?? ''} ${getLabel(attempts_remaining)} $attemptsRemaining',
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
      }
    }
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
