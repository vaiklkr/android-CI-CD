

import 'package:dropdown_search/dropdown_search.dart';
import 'package:finjoy_app/api/auth/bloc/get_city_pincode_bloc.dart';
import 'package:finjoy_app/api/auth/model/get_city_pincode_model.dart';
import 'package:finjoy_app/api/auth/model/personal_details_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/screens/profile/my_profile_screen.dart';
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
import '../../utils/dropdown_list_item.dart';
import '../../utils/shared_pref.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen(
      {super.key, required this.editphoneController});

  final TextEditingController editphoneController;
  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  String? selectedValue;
  String? lanChange = 'English';

  DateTime minimumDate = DateTime.now().subtract(Duration(days: 18 * 365));

  String? driving;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController pincontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  // TextEditingController districtcontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  final _repository = Repository();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String? apiDateFormate;
  FocusNode dobNode = FocusNode();
  bool _isChecked = false;
  String occupationValue = getLabel(select_occupation);
  String qualificationValue = getLabel(select_qualification);
  String incomeValue = getLabel(select_income);
  String cityValue = getLabel(select_city);
  String? selectedState;
  String? statename;
  String? districtName;

  @override
  void initState() {
    getCityPincodeBloc.getCityPincodeSink(pincontroller.text);
    super.initState();
  }

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
                  title: getLabel(personal_information),
                  subtitle: getLabel(fill_all_the_details_mentioned_below)),
              sizeBoxHeight(5.h),
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h),
                      child: Column(
                        children: [
                          occupationDropdown(),
                          sizeBoxHeight(20.h),
                          qualification(),
                          sizeBoxHeight(20.h),
                          income(),
                          sizeBoxHeight(20.h),
                          dobTextfield(),
                          sizeBoxHeight(20.h),
                          pinTextfiled(),
                          sizeBoxHeight(30.h),
                          checkText(),
                          sizeBoxHeight(20.h),
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
    );
  }

  Widget occupationDropdown() {
    return showDropDown(
      hint: getLabel(select_occupation),
      dropdownList: occupationDropdownList,
      selectedItem: '',
      onSelectionChanged: (selectedValue) {
        setState(() {
          occupationValue = selectedValue;
        });
      },
    );
  }

  Widget qualification() {
    return showDropDown(
      hint: getLabel(select_qualification),
      dropdownList: qualificationDropdownList,
      selectedItem: '',
      onSelectionChanged: (selectedValue) {
        setState(() {
          qualificationValue = selectedValue;
        });
      },
    );
  }

  Widget income() {
    return showDropDown(
      hint: getLabel(select_income),
      dropdownList: incomeDropdownList,
      selectedItem: '',
      onSelectionChanged: (selectedValue) {
        setState(() {
          incomeValue = selectedValue;
        });
      },
    );
  }

  Widget dobTextfield() {
    return AppTextFormField(
      readOnly: true,
      onTap: () => _showDialog(
        CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          showDayOfWeek: true,
          initialDateTime: minimumDate,
          // minimumDate: minimumDate,
          maximumDate: minimumDate,
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              apiDateFormate = DateFormat('yyyy/MM/dd').format(newDate);
              String formattedDate = DateFormat('yyyy/MM/dd').format(newDate);
              dateinput.text = formattedDate;
            });
          },
        ),
      ),
      validator: birthdateValidate,
      inputAction: TextInputAction.next,
      controller: dateinput,
      focusNode: dobNode,
      label: 'DD/MM/YYYY',
      hint: 'DD/MM/YYYY',
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  Widget pinTextfiled() {
    return StreamBuilder<GetCityPincodeModel>(
        stream: getCityPincodeBloc.getCityPincodeStream,
        builder: (context,
            AsyncSnapshot<GetCityPincodeModel> getCityPincodesnapshot) {
          String? initialState = getCityPincodesnapshot.data?.data?.state;
          String? initialDistrict = getCityPincodesnapshot.data?.data?.district;
          print('=====================> ${getCityPincodesnapshot.data?.data?.district}');
          statename = initialState;
          districtName = initialDistrict;
          // districtcontroller.text = initialDistrict!;
          return Column(
            children: [
              AppTextFormField(
                  label: getLabel(pincode),
                  validator: pincodeValidate,
                  hint: getLabel(enter_pin),
                  inputAction: TextInputAction.next,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: pincontroller,
                  onChanged: (value) {
                    if (pincontroller.text.length == 6) {
                      getCityPincodeBloc.getCityPincodeSink(pincontroller.text);
                      setState(() {});
                    } else {
                      if (pincontroller.text.length == 5) {
                        getCityPincodeBloc
                            .getCityPincodeSink(pincontroller.text);
                        setState(() {});
                      }
                    }
                  }),
              sizeBoxHeight(vDefaultPadding * 1.5),
              showDropDown(
                readOnly: getCityPincodesnapshot.data?.data?.name != null
                    ? false
                    : pincontroller.text.length == 5 ||
                    pincontroller.text.length == 6
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
              sizeBoxHeight(vDefaultPadding * 1.5),
              // AppTextFormField(
              //   label: getLabel(enter_district),
              //   validator: districtValidate,
              //   inputAction: TextInputAction.next,
              //   hint: getLabel(enter_district),
              //   controller: districtcontroller,
              //   inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
              // ),
              // sizeBoxHeight(vDefaultPadding * 1.5),
              AppTextFormField(
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
            ],
          );
        });
  }

  Widget checkText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              activeColor: AppColor.bluecolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AppText(
                      text: 'Want regular',
                      color: AppColor.blackcolor,
                      fontsize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    sizeBoxWidth(vDefaultSize),
                    Image.asset(
                      '${AppImages.loginimages}whimage.png',
                      height: 20,
                    ),
                    sizeBoxWidth(vDefaultSize),
                    AppText(
                      text: 'Whatsapp updates Mark',
                      color: AppColor.blackcolor,
                      fontsize: 13.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                AppText(
                  text: 'checkbox to be notified.',
                  color: AppColor.blackcolor,
                  fontsize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
        sizeBoxHeight(vDefaultPadding * 2),
        AppButton(
            color: AppColor.bluecolor,
            onPress: () {
              if (_key.currentState?.validate() ?? false) {
                onPersonalDetailsAPI();
              }
            },
            text: getLabel(txt_continue)),
      ],
    );
  }

  dynamic onPersonalDetailsAPI() async {
    Loader().showLoader(context);
    if (!mounted) return;
    final PersonalDetailsModel ispersonaldetails =
        await _repository.onPersonalDetails(
            occupationValue,
            qualificationValue,
            incomeValue,
            cityValue,
            statename!,
            districtName!,
            _isChecked == "true",
            pincontroller.text,
            apiDateFormate.toString());
    Loader().hideLoader(context);
    if (ispersonaldetails.success == true) {
      PrefObj.preferences!.put(PrefKeys.ProfileImage, ''/*'${AppImages.profileimages}profile.png'*/);
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) {
          return const MyProfileScreen(
            navigate: BackNavigatorType.onnavigate,
          );
        },
      ));
      Fluttertoast.showToast(
          msg: ispersonaldetails.message ?? '',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.bluecolor,
          textColor: Colors.white,
          fontSize: 16.0);
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColor.bluecolor,
      //   content: AppText(
      //     text: getLabel(personal_details_insert_successfully),
      //     fontWeight: FontWeight.w600,
      //     fontsize: 16.sp,
      //     color: AppColor.whitecolor,
      //   ),
      // ),
      // );
    } else {


    }
  }
}
