// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'dart:async';
import 'dart:convert';
import 'package:finjoy_app/api/kyc/model/verify_aadhaar_model.dart';
import 'package:finjoy_app/api/kyc/model/verify_captcha_model.dart';
import 'package:finjoy_app/api/kyc/model/verify_pan_model.dart';
import 'package:finjoy_app/api/kyc/model/confirm_pan_model.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/screens/profile/aadhar_kyc_otp_screen.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../api/appLabel/app_label_service.dart';
import '../../api/repository/repository.dart';

class KYCVerifactionScreen extends StatefulWidget {
  final void Function(bool) onClose;
  const KYCVerifactionScreen({super.key, required this.onClose});

  @override
  State<KYCVerifactionScreen> createState() => _KYCVerifactionScreenState();
}

class _KYCVerifactionScreenState extends State<KYCVerifactionScreen> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController dobController = TextEditingController();
  FocusNode dobNode = FocusNode();
  bool verifyVisibility = true;
  final _repository = Repository();
  TextEditingController panController = TextEditingController();
  TextEditingController nameaspanController = TextEditingController();
  TextEditingController confirmpanController = TextEditingController();
  TextEditingController panholdernameController = TextEditingController();

  TextEditingController adharController = TextEditingController();
  bool panTextfiled = true;
  bool firstApi = true;
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
              CustomAppBar(
                  title: getLabel(kyc_verification),
                  subtitle: getLabel(verify_your_pan_details)),
              sizeBoxHeight(32.h),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        children: [
                          // textField(),
                          panCardImage(),
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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: vDefaultPadding,
                right: vDefaultPadding,
                top: vDefaultPadding,
                bottom: vDefaultPadding * 1.5.h),
            child: verifyButton(),
          ),
        ],
      ),
    );
  }

  Widget panCardImage() {
    return Stack(
      children: [
        Image.asset('${AppImages.kycsucessimages}pan_card.png'),
        Padding(
          padding: const EdgeInsets.only(top: 87, right: 23, left: 24),
          child: Column(
            children: [
              Container(
                  height: 38,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.whitecolor,
                      borderRadius: BorderRadius.circular(2.r)),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
                    ],
                    // validator: validatePancard,
                    validator: (value) {
                      if (validatePancard(value) != null) {
                        return null;
                      } else {
                        Fluttertoast.showToast(
                          msg: "Invalid PAN card",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColor.bluecolor,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        return "Please Enter PAN Number";
                      }
                    },
                    controller: panController,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                          left: 20, bottom: 11, top: 20, right: 15),
                      hintText: getLabel(pan_number),
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textfieldtextcolor,
                      ),
                    ),
                  )),
              sizeBoxHeight(35),
              Visibility(
                  visible: !verifyVisibility,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        AppText(
                          text: panholdernameController.text,
                          fontsize: 16.sp,
                          color: AppColor.blackcolor,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget textField() {
    return Column(
      children: [
        AppTextFormField(
          label: getLabel(pan_number),
          hint: getLabel(pan_number),
          maxLength: 10,
          validator: validatePancard,
          controller: panController,
          inputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
          ],
          textCapitalization: TextCapitalization.characters,
        ),
        sizeBoxHeight(16.h),
        Visibility(
          visible: !verifyVisibility,
          child: Container(
            height: 64.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColor.backgreencolor,
                borderRadius: BorderRadius.circular(8.r)),
            child: AppTextFormField(
              label: getLabel(name_as_in_pan),
              hint: '',
              readOnly: true,
              validator: nameasPanvalidate,
              controller: panholdernameController,
              inputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        // Visibility(
        //   visible: !verifyVisibility,
        //   child: AppTextFormField(
        //     label: 'Confirm PAN number',
        //     hint: 'ConfirmPAN number',
        //     maxLength: 10,
        //     validator: (value) {
        //       if (value == null || value.isEmpty) {
        //         return 'Please enter re enter m pin';
        //       }
        //       if (value != panController.text) {
        //         return 'Passwords do not match';
        //       }
        //       return null;
        //     },
        //     controller: confirmpanController,
        //     inputAction: TextInputAction.next,
        //     keyboardType: TextInputType.text,
        //   ),
        // ),
        // sizeBoxHeight(16.h),
        // Visibility(
        //   visible: !verifyVisibility,
        //   child: AppTextFormField(
        //     label: 'Pan holder name',
        //     controller: panholdernameController,
        //     hint: '',
        //   ),
        // ),
      ],
    );
  }

  Widget dobTextfield() {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101));

        if (pickedDate != null) {
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

          setState(() {
            dateinput.text = formattedDate;
          });
        } else {}
      },
      child: AppTextFormField(
        readOnly: true,
        inputAction: TextInputAction.next,
        controller: dateinput,
        focusNode: dobNode,
        label: 'DD/MM/YYYY',
        hint: 'DD/MM/YYYY',
      ),
    );
  }

  Widget verifyButton() {
    return AppButton(
        color: AppColor.bluecolor,
        onPress: () {
          if (_key.currentState?.validate() ?? false) {
            if (firstApi == true) {
              onVerifyPanAPI();
            } else if (firstApi == false) {
              onConfirmPanAPI();
            }
          }
        },
        text: getLabel(verify_and_continue));
  }

  Future<bool> onVerifyPanAPI() async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final VerifyPanModel isverifyPan =
        await _repository.onVerifyPan(panController.text);
    Loader().hideLoader(context);
    if (isverifyPan.success == true) {
      panholdernameController.text = isverifyPan.data?.name ?? '';
      verifyVisibility = false;
      firstApi = !firstApi;
      setState(() {});
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColor.bluecolor,
      //   content: AppText(
      //     text: isverifyPan.message ?? '',
      //     fontWeight: FontWeight.w600,
      //     fontsize: 16.sp,
      //     color: AppColor.whitecolor,
      //   ),
      // ));
      return true;
    } else {
      if (isverifyPan.success == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isverifyPan.message ?? '',
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
      }
      return false;
    }
  }

  Future<bool> onConfirmPanAPI() async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final ConfirmPANModel isconfirmPan = await _repository.onConfirmPan(
        panController.text, panholdernameController.text);
    Loader().hideLoader(context);
    if (isconfirmPan.success == true) {
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) {
          return AadharScreen(
            onClose: (value) {
              widget.onClose(value);
              setState(() {});
            },
          );
        },
      ));
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColor.bluecolor,
      //   content: AppText(
      //     text: isconfirmPan.message ?? '',
      //     fontWeight: FontWeight.w600,
      //     fontsize: 16.sp,
      //     color: AppColor.whitecolor,
      //   ),
      // ));
      return true;
    } else {
      if (isconfirmPan.success == false) {
        // Navigator.push(context, CupertinoPageRoute(
        //   builder: (context) {
        //     return const AadharScreen();
        //   },
        // ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isconfirmPan.message ?? '',
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

class AadharScreen extends StatefulWidget {
  final void Function(bool) onClose;
  const AadharScreen({super.key, required this.onClose});

  @override
  State<AadharScreen> createState() => _AadharScreenState();
}

class _AadharScreenState extends State<AadharScreen> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController dobController = TextEditingController();
  FocusNode dobNode = FocusNode();
  bool verifyVisibility = true;
  final _repository = Repository();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  TextEditingController adharController = TextEditingController();

  bool panTextfiled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: Form(
        key: _key,
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                  title: getLabel(kyc_verification),
                  subtitle: getLabel(verify_your_pan_details)),
              sizeBoxHeight(32.h),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        children: [
                          aadharImage()
                          // textField(),
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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: vDefaultPadding,
                right: vDefaultPadding,
                top: vDefaultPadding,
                bottom: vDefaultPadding * 1.5.h),
            child: verifyButton(),
          ),
        ],
      ),
    );
  }

  Widget aadharImage() {
    return Stack(
      children: [
        Image.asset('${AppImages.kycsucessimages}aadhar_card.png'),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: getLabel(enter_aadhar_number),
                color: AppColor.textgraycolor,
                fontsize: 14,
                fontWeight: FontWeight.w400,
              ),
              sizeBoxHeight(10),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.whitecolor,
                    borderRadius: BorderRadius.circular(8.r)),
                child: CreditcardFormField(
                  controller: adharController,
                  keyboardType: TextInputType.number,
                  validator: validateAadharard,
                  maxLength: 14,
                  label: getLabel(enter_aadhar_number),
                  hint: '',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget textField() {
    return Column(
      children: [
        CreditcardFormField(
          controller: adharController,
          keyboardType: TextInputType.number,
          validator: validateAadharard,
          maxLength: 14,
          label: getLabel(enter_aadhar_number),
          hint: '',
        ),
      ],
    );
  }

  Widget verifyButton() {
    return AppButton(
        color: AppColor.bluecolor,
        onPress: () {
          if (_key.currentState?.validate() ?? false) {
            onVerifyAadhaarAPI();
          }
        },
        text: getLabel(verify_and_continue));
  }

  Future<bool> onVerifyAadhaarAPI() async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final VerifyAadhaarModel isverifyAadhar =
        await _repository.onVerifyAadhar(adharController.text);
    Loader().hideLoader(context);
    if (isverifyAadhar.success == true) {
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) {
          return AadharDetailScreen(
            aadharNum: adharController.text,
            data: isverifyAadhar.data,
            onClose: (value) {
              widget.onClose(value);
              setState(() {});
            },
          );
        },
      ));
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColor.bluecolor,
      //   content: AppText(
      //     text: isverifyAadhar.message ?? '',
      //     fontWeight: FontWeight.w600,
      //     fontsize: 16.sp,
      //     color: AppColor.whitecolor,
      //   ),
      // ));
      return true;
    } else {
      if (isverifyAadhar.success == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isverifyAadhar.message ?? '',
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

class AadharDetailScreen extends StatefulWidget {
  final void Function(bool) onClose;
  const AadharDetailScreen(
      {super.key,
      required this.aadharNum,
      required this.data,
      required this.onClose});
  final String aadharNum;
  final VerifyAadhaarData? data;

  @override
  State<AadharDetailScreen> createState() => _AadharDetailScreenState();
}

class _AadharDetailScreenState extends State<AadharDetailScreen> {
  bool isStartScreen = true;

  TextEditingController dateinput = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController captchaController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _repository = Repository();

  FocusNode dobNode = FocusNode();

  TextEditingController adharController = TextEditingController();

  bool panTextfiled = true;

  TextEditingController? editadharController;

  @override
  Widget build(BuildContext context) {
    editadharController =
        TextEditingController(text: widget.aadharNum.toString());
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: Form(
        key: _key,
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                  title: getLabel(kyc_verification),
                  subtitle: getLabel(verify_your_pan_details)),
              sizeBoxHeight(32.h),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(left: 37.w, right: 37.w),
                      child: Column(
                        children: [
                          textField(),
                          sizeBoxHeight(20.h),
                          captchaImage(),
                          sizeBoxHeight(20.h),
                          enterCaptchaTextfiled()
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
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: vDefaultPadding,
                right: vDefaultPadding,
                bottom: vDefaultPadding * 1.5.h),
            child: verifyButton(),
          ),
        ],
      ),
    );
  }

  Widget textField() {
    return Column(
      children: [
        Container(
          color: AppColor.backgreencolor,
          child: CreditcardFormField(
            readOnly: true,
            controller: editadharController,
            keyboardType: TextInputType.number,
            maxLength: 14,
            label: getLabel(enter_aadhar_number),
            hint: '',
          ),
        ),
      ],
    );
  }

  Widget captchaImage() {
    List<int> bytes = [];
    String? base64String = widget.data?.captchaImage?.toString();

    if (base64String != null) {
      try {
        bytes = base64.decode(base64String.split(',').last);
      } catch (e) {
        print('Error decoding base64 image: $e');
      }
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: AppColor.graycolor)),
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Row(
                children: [
                  AppText(
                    text: getLabel(aadhar_captcha),
                    fontsize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textfieldtextcolor,
                  ),
                ],
              ),
            ),
            sizeBoxHeight(15.h),
            bytes.isNotEmpty
                ? Image.memory(
                    Uint8List.fromList(bytes),
                  )
                : Text('Error loading captcha image'),
          ],
        ),
      ),
    );
  }

  Widget enterCaptchaTextfiled() {
    return AppTextFormField(
      label: getLabel(enter_captcha),
      controller: captchaController,
      // validator: validatecaptcha,
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter the captcha';
      //   } else if (value.toUpperCase() != widget.data!.captchaImage) {
      //     return 'Captcha does not match';
      //   }
      //   return null;
      // },
      hint: '',
    );
  }

  Widget verifyButton() {
    return AppButton(
        color: AppColor.bluecolor,
        onPress: () {
          if (_key.currentState?.validate() ?? false) {
            onVerifyCaptchaAPI(widget.data);
          }

          // setState(() {
          //   generateCaptcha();
          //   captchaController.clear();
          //   isCaptchaValid = false;
          // });
          // Navigator.push(context, CupertinoPageRoute(
          //   builder: (context) {
          //     return const KYCOTPScreen();
          //   },
          // ));
        },
        text: getLabel(verify_captcha));
  }

  Future<bool> onVerifyCaptchaAPI(VerifyAadhaarData? data) async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final VerifyCaptchaModel isverifyCaptcha =
        await _repository.onVerifyCaptcha(
            editadharController!.text.trim(),
            data?.sessionid ?? '',
            data?.referenceId ?? '',
            captchaController.text);
    Loader().hideLoader(context);
    if (isverifyCaptcha.success == true) {
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) {
          return AadharKYCOTPScreen(
            aadharNum: editadharController!.text.trim(),
            data: widget.data,
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
