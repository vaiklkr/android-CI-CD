// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../api/appLabel/app_label_service.dart';
import '../../../api/auth/bloc/get_city_pincode_bloc.dart';
import '../../../api/auth/model/get_city_pincode_model.dart';
import '../../../api/const/config.dart';
import '../../../api/creditcard/model/add_customer_model.dart';
import '../../../api/repository/repository.dart';
import '../../../core/app_validation.dart';
import '../../../utils/dropdown_list_item.dart';
import '../../../widgets/custom_button.dart';
import 'package:http/http.dart' as http;

class AddCustomerScreen extends StatefulWidget {
  const AddCustomerScreen({super.key});

  @override
  State<AddCustomerScreen> createState() => _AddCustomerScreenState();
}

class _AddCustomerScreenState extends State<AddCustomerScreen> {
  String serviceName = '';
  TextEditingController mobileController = TextEditingController();
  TextEditingController panNumberController = TextEditingController();
  TextEditingController panNameController = TextEditingController();
  TextEditingController customermailidController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController serviceController = TextEditingController();

  final _repository = Repository();

  bool isValidationOn = false;
  String? statename;
  String cityValue = getLabel(select_city);
  String? selectedState;

  static Map<String, dynamic> labels = {};

  fetchData() async {
    Loader().showLoader(context);
    final Uri url = Uri.parse(Config.panVerifyUrl);
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${PrefObj.preferences?.get(PrefKeys.DEVICETOKEN)}', // Replace with your authorization logic
    };
    final Map<String, String> params = {
      'pannumber': panNumberController.text,
    };

    final Uri finalUrl = url.replace(queryParameters: params);

    final response = await http.get(finalUrl, headers: headers);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['success']) {
        setState(() {
          labels = Map<String, dynamic>.from(data['data']);
          panNameController.text = getValue('panname');
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } else {
      throw Exception('Failed to fetch data');
    }
    Loader().hideLoader(context);
  }

  String getValue(String key) {
    return labels[key].toString();
  }

  Future<bool> onAddCustomerAPI() async {
    if (!mounted) return true;
    Loader().showLoader(context);
    try {
      final AddCustomerModel isAddCustomer = await _repository.onAddCustomerApi(
          mobileController.text.toString(),
          panNumberController.text.toString(),
          panNameController.text.toString(),
          customermailidController.text.toString(),
          pinCodeController.text.toString(),
          statename!,
          districtController.text.toString(),
          cityValue,
          PrefObj.preferences!.get(PrefKeys.OfferId).toString(),
          getValue('panid'));
      if (isAddCustomer.success == true) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isAddCustomer.message ?? '',
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
        return true;
      } else {
        if (isAddCustomer.success == false) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: AppColor.bluecolor,
            content: AppText(
              text: isAddCustomer.message ?? '',
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

  @override
  Widget build(BuildContext context) {
    setState(() {
      serviceController.text =
          PrefObj.preferences!.get(PrefKeys.OfferTitle).toString();
    });

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [const HomeCustomAppbar(), creditDetails()]));
  }

  Widget creditDetails() {
    return Container(
      margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
      padding: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w, bottom: 20.h),
      decoration: BoxDecoration(
          color: AppColor.whitecolor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addcustomer(),
            sizeBoxHeight(15.h),
            panTextfiled(),
            sizeBoxHeight(15.h),
            privacyPolicy(),
            sizeBoxHeight(15.h),
            continuButton(),
            sizeBoxHeight(15.h),
            needhelp(),
          ],
        ),
      ),
    );
  }

  Widget addcustomer() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.5.r),
                color: AppColor.bluecolor),
            child: Center(
                child: Image.asset('${AppImages.sellearnimages}back.png',
                    height: 14.h)),
          ),
        ),
        sizeBoxWidth(12.w),
        AppText(
          text: getLabel(add_customer),
          fontsize: 20.sp,
          fontWeight: FontWeight.w600,
          color: AppColor.blacktextcolor,
        ),
      ],
    );
  }

  Widget panTextfiled() {
    return Column(
      children: [
        AppTextFormField(
          controller: mobileController,
          errorText: validation(mobileController),
          keyboardType: TextInputType.phone,
          maxLength: 10,
          textInputAction: TextInputAction.next,
          label: getLabel(enter_mobile_number),
          hint: '',
        ),
        sizeBoxHeight(20.h),
        Row(
          children: [
            Flexible(
              child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                SizedBox(
                  height: 52,
                  child: AppTextFormField(
                    controller: panNumberController,
                    errorText: validation(panNumberController),
                    keyboardType: TextInputType.text,
                    maxLength: 10,
                    textInputAction: TextInputAction.next,
                    label: getLabel(enter_pan_card_number),
                    hint: '',
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
                    ],
                    textCapitalization: TextCapitalization.characters,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    fetchData();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 1,top: 1,bottom: 1),
                    child: Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(7.r), bottomRight: Radius.circular(7.r)),
                        color: const Color(0xff1775D3),
                      ),
                      child: Center(
                        child: AppText(
                          text: getLabel(verify),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          fontsize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.whitecolor,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
        sizeBoxHeight(20.h),
        AppTextFormField(
          controller: panNameController,
          errorText: validation(panNameController),
          keyboardType: TextInputType.name,
          maxLength: 10,
          readOnly: true,
          textInputAction: TextInputAction.next,
          label: getLabel(enter_name_as_per_pan_card),
          hint: '',
        ),
        sizeBoxHeight(20.h),
        AppTextFormField(
          controller: customermailidController,
          errorText: validation(customermailidController),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          label: getLabel(enter_email_id),
          hint: '',
        ),
        // sizeBoxHeight(20.h),
        // AppTextFormField(
        //   controller: panNumberController,
        //   errorText: validation(panNumberController),
        //   keyboardType: TextInputType.text,
        //   maxLength: 10,
        //   textInputAction: TextInputAction.next,
        //   label: getLabel(enter_pan_card_number),
        //   hint: '',
        // ),
        sizeBoxHeight(20.h),
        pinTextfiled(),
        // AppTextFormField(
        //   controller: pinCodeController,
        //   errorText: validation(pinCodeController),
        //   keyboardType: TextInputType.number,
        //   textInputAction: TextInputAction.next,
        //   label: getLabel(enter_pin_code),
        //   hint: '',
        // ),
        // customermobilenumber
        // pannumber
        // nameasperpan
        // pincode
        // state
        // district
        // city
        // offerid
        // panverificationid
        // sizeBoxHeight(20.h),
        // AppTextFormField(
        //   controller: stateController,
        //   errorText: validation(stateController),
        //   keyboardType: TextInputType.name,
        //   textInputAction: TextInputAction.next,
        //   label: getLabel(enter_state),
        //   hint: '',
        // ),
        // sizeBoxHeight(20.h),
        // AppTextFormField(
        //   controller: cityController,
        //   errorText: validation(cityController),
        //   keyboardType: TextInputType.name,
        //   textInputAction: TextInputAction.next,
        //   label: getLabel(select_district),
        //   hint: '',
        // ),
        // sizeBoxHeight(20.h),
        // AppTextFormField(
        //   controller: districtController,
        //   errorText: validation(districtController),
        //   keyboardType: TextInputType.name,
        //   textInputAction: TextInputAction.next,
        //   label: getLabel(select_district),
        //   hint: '',
        // ),
        sizeBoxHeight(20.h),
        Container(
          color: const Color(0xffe3e1e1),
          child: AppTextFormField(
            controller: serviceController,
            readOnly: true,
            label: getLabel(service),
            hint: 'Swiggy HDFC Bank Credit Card',
          ),
        ),
      ],
    );
  }

  Widget pinTextfiled() {
    return StreamBuilder<GetCityPincodeModel>(
        stream: getCityPincodeBloc.getCityPincodeStream,
        builder: (context,
            AsyncSnapshot<GetCityPincodeModel> getCityPincodesnapshot) {
          String? initialState = getCityPincodesnapshot.data?.data?.state;
          statename = initialState;
          return Column(
            children: [
              AppTextFormField(
                  label: getLabel(pincode),
                  validator: pincodeValidate,
                  hint: getLabel(enter_pin),
                  inputAction: TextInputAction.next,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  controller: pinCodeController,
                  onChanged: (value) {
                    if (value.length == 6) {
                      getCityPincodeBloc.getCityPincodeSink(pinCodeController.text);
                      String? initialDistrict = getCityPincodesnapshot.data?.data?.district;
                      districtController.text = initialDistrict!;
                      setState(() {});
                    } else {
                      if (value.length == 5) {
                        getCityPincodeBloc
                            .getCityPincodeSink(pinCodeController.text);
                        String? initialDistrict = getCityPincodesnapshot.data?.data?.district;
                        districtController.text = initialDistrict!;
                        setState(() {});
                      }
                    }
                  }),
              sizeBoxHeight(20.h),
              showDropDown(
                readOnly: getCityPincodesnapshot.data?.data?.name != null
                    ? false
                    : pinCodeController.text.length == 5 ||
                    pinCodeController.text.length == 6
                    ? false
                    : true,
                hint: getLabel(select_city),
                dropdownList: cityDropdownList(
                    getCityPincodesnapshot.data?.data?.name ?? []),
                selectedItem: cityValue ?? '',
                onSelectionChanged: (selectedValue) {
                  setState(() {
                    cityValue = selectedValue;
                  });
                },
              ),
              sizeBoxHeight(20.h),
              // AppTextFormField(
              //   label: getLabel(enter_district),
              //   inputAction: TextInputAction.next,
              //   hint: getLabel(enter_district),
              //   controller: districtController,
              // ),
              // sizeBoxHeight(20.h),
              Container(
                color: const Color(0xffe3e1e1),
                child: AppTextFormField(
                  label: getLabel(state),
                  validator: stateValidate,
                  readOnly: true,
                  inputAction: TextInputAction.next,
                  hint: getLabel(enter_state),
                  controller: TextEditingController(text: initialState),
                  onChanged: (value) {
                    setState(() {
                      selectedState = value;
                    });
                  },
                ),
              ),
            ],
          );
        });
  }

  Widget privacyPolicy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // RichText(
        //   text: TextSpan(
        //     text: 'Hello ',
        //     style: DefaultTextStyle.of(context).style,
        //     children: <TextSpan>[
        //       TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
        //       TextSpan(text: ' world!'),
        //     ],
        //   ),
        // ),
        Row(
          children: [
            AppText(
              text: 'By continuing you agree ',
              fontsize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.graytext1color,
            ),
            AppText(
              text: 'Terms & Conditions ',
              fontsize: 13.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.bluecolor,
            ),
            AppText(
              text: 'and ',
              fontsize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.graytext1color,
            ),
            AppText(
              text: 'Privacy',
              fontsize: 13.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.bluecolor,
            ),
          ],
        ),
        AppText(
          text: 'Policy.',
          fontsize: 13.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.bluecolor,
        ),
      ],
    );
  }

  Widget continuButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isValidationOn = true;
        });

        // if (panNameController.text.isNotEmpty &&
        //     panNumberController.text.isNotEmpty &&
        //     stateController.text.isNotEmpty &&
        //     cityValue.isNotEmpty &&
        //     pinCodeController.text.isNotEmpty) {
          onAddCustomerAPI();
        // }
        // Navigator.push(context, CupertinoPageRoute(
        //         //   builder: (context) {
        //         //     return const LoansScreen();
        //         //   },
        //         // ));
      },
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: const Color(0xff1775D3)),
        child: Center(
          child: AppText(
            text: getLabel(txt_continue),
            fontsize: 17.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.whitecolor,
          ),
        ),
      ),
    );
  }

  Widget needhelp() {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, CupertinoPageRoute(
        //   builder: (context) {
        //     return const FinjoyBriefcaseScreen();
        //   },
        // ));
      },
      child: Container(
        height: 43.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(color: const Color(0xff1775D3))),
        child: Center(
          child: AppText(
            text: getLabel(need_help),
            fontsize: 15.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff1775D3),
          ),
        ),
      ),
    );
  }

  String? validation(controller) {
    if (isValidationOn) {
      if (controller == panNameController) {
        if (panNameController.text.isEmpty) {
          return '${getLabel(please)} ${getLabel(enter_name_as_per_pan_card)}';
        } else {
          return null;
        }
      } else if (controller == panNumberController) {
        if (panNumberController.text.isEmpty) {
          return '${getLabel(please)} ${getLabel(enter_pan_card_number)}';
        } else {
          return null;
        }
      } else if (controller == stateController) {
        if (stateController.text.isEmpty) {
          return getLabel(please_select_state);
        } else {
          return null;
        }
      } else if (controller == cityController) {
        if (cityController.text.isEmpty) {
          return getLabel(please_select_city);
        } else {
          return null;
        }
      } else if (controller == pinCodeController) {
        if (pinCodeController.text.isEmpty) {
          return '${getLabel(please)} ${getLabel(enter_pin_code)}';
        } else {
          return null;
        }
      } else if (controller == customermailidController) {
        if (customermailidController.text.isEmpty) {
          return '${getLabel(please)} ${getLabel(enter_email_id)}';
        } else {
          return null;
        }
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
