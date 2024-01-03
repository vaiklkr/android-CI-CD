// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:io';

import 'package:finjoy_app/api/auth/bloc/get_city_pincode_bloc.dart';
import 'package:finjoy_app/api/auth/bloc/get_user_personal_details_bloc.dart';
import 'package:finjoy_app/api/auth/model/get_city_pincode_model.dart';
import 'package:finjoy_app/api/auth/model/get_user_personal_details_model.dart';
import 'package:finjoy_app/api/auth/model/personal_details_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/utils/dropdown_list_item.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../api/appLabel/app_label_service.dart';

class EditPersonalInfoScreen extends StatefulWidget {
  final VoidCallback onclose;

  const EditPersonalInfoScreen({super.key, required this.onclose});

  @override
  State<EditPersonalInfoScreen> createState() => _EditPersonalInfoScreenState();
}

class _EditPersonalInfoScreenState extends State<EditPersonalInfoScreen> {
  String occupationValue = getLabel(select_occupation);
  String qualificationValue = getLabel(select_qualification);
  String incomeValue = getLabel(select_income);
  String cityValue = getLabel(select_city);
  FocusNode dobNode = FocusNode();
  final _repository = Repository();
  final bool _isChecked = false;
  bool isSecond = false;

  String? apiDateFormate;
  String? selectedState;
  String? statename;
  TextEditingController dateinput = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController pincontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController districtcontroller = TextEditingController();
  final _picker = ImagePicker();
  String path = "";
  bool isStart = true;
  String profileImg = '';

  DateTime minimumDate = DateTime.now().subtract(Duration(days: 18 * 365));

  String formatApiDate(String apiDate) {
    if (apiDate.isNotEmpty) {
      DateTime parsedDate = DateTime.parse(apiDate);
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    } else {
      return '';
    }
  }

  @override
  void initState() {
    profileImg = PrefObj.preferences!.get(PrefKeys.ProfileImage).toString();
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   showDialog(
    //     context: context,
    //     builder: (context) {
    //       return imageePicker();
    //     },
    //   );
    // });
    getUserPersonalDetailsBloc.getUserPersonalDetailsSink();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: SafeArea(
          child: Column(
        children: [
          CustomAppBar(
              title: getLabel(personal_information),
              subtitle: getLabel(fill_all_the_details_mentioned_below)),
          sizeBoxHeight(21.h),
          Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: vDefaultPadding, right: vDefaultPadding),
                  child: Column(
                    children: [
                      profileImageHome(),
                      sizeBoxHeight(9.h),
                      profileText(),
                      sizeBoxHeight(21.h),
                      StreamBuilder<GetUserPersonalDetailsModel>(
                          stream: getUserPersonalDetailsBloc
                              .getUserPersonalDetailsStream,
                          builder: (context,
                              AsyncSnapshot<GetUserPersonalDetailsModel>
                                  getUserPersonalDetailssnapshot) {
                            if (!getUserPersonalDetailssnapshot.hasData) {
                              return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: const Center(
                                      child: CircularProgressIndicator()));
                            }

                            if (isStart) {
                              occupationValue = (getUserPersonalDetailssnapshot
                                      .data?.data?[0].occupation)
                                  .toString();
                              qualificationValue =
                                  (getUserPersonalDetailssnapshot
                                          .data?.data?[0].qualification)
                                      .toString();
                              incomeValue = (getUserPersonalDetailssnapshot
                                      .data?.data?[0].income)
                                  .toString();

                              pincontroller.text =
                                  (getUserPersonalDetailssnapshot
                                          .data?.data?[0].pincode)
                                      .toString();

                              districtcontroller.text =
                                  (getUserPersonalDetailssnapshot
                                          .data?.data?[0].district)
                                      .toString();

                              getCityPincodeBloc.getCityPincodeSink(pincontroller.text);

                              cityValue = (getUserPersonalDetailssnapshot
                                      .data?.data?[0].city)
                                  .toString();

                              statecontroller.text =
                                  (getUserPersonalDetailssnapshot
                                          .data?.data?[0].state)
                                      .toString();
                              String apiDate = getUserPersonalDetailssnapshot
                                      .data?.data?[0].dob ??
                                  '';
                              String formattedDate = formatApiDate(apiDate);

                              dateinput.text = formattedDate;
                              isStart = false;
                            }
                            return Column(
                              children: [
                                occupationDropdown(
                                    getUserPersonalDetailssnapshot),
                                sizeBoxHeight(20.h),
                                qualification(getUserPersonalDetailssnapshot),
                                sizeBoxHeight(20.h),
                                income(getUserPersonalDetailssnapshot),
                                sizeBoxHeight(20.h),
                                dobTextfield(),
                                sizeBoxHeight(20.h),
                                pinTextfiled(getUserPersonalDetailssnapshot),
                                sizeBoxHeight(20.h),
                                sizeBoxHeight(19.h),
                                editButton(),
                                sizeBoxHeight(vDefaultPadding * 2.5),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  Widget profileImageHome() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 132.h,
          width: 132.w,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.blackcolor, width: 1),
            // image: path == ""
            //     ? profileImg.contains('https://')
            //         ? DecorationImage(
            //             image: NetworkImage(profileImg), fit: BoxFit.cover)
            //         : DecorationImage(
            //             image:
            //                 AssetImage('${AppImages.profileimages}profile.png'),
            //             fit: BoxFit.fill)
            //     : DecorationImage(
            //         image: FileImage(
            //           File(path),
            //         ),
            //         fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: profileImage(context, 132.h, AppColor.blackcolor, false),
        ),
        GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (context) {
              return imageePicker();
            },
          ),
          child: Image.asset('${AppImages.profileimages}add.png', height: 34.h),
        )
      ],
    );
  }

  // Widget profileImage() {
  //   return Stack(
  //     alignment: Alignment.bottomRight,
  //     children: [
  //       Container(
  //         height: 132.h,
  //         width: 132.h,
  //         decoration: BoxDecoration(
  //             border: Border.all(color: AppColor.blackcolor, width: 1),
  //             image: path == ""
  //                 ? DecorationImage(
  //                     image:
  //                         AssetImage('${AppImages.profileimages}profile.png'))
  //                 : DecorationImage(
  //                     image: FileImage(
  //                       File(path),
  //                     ),
  //                     fit: BoxFit.fill),
  //             borderRadius: BorderRadius.circular(100.r)),
  //       ),
  //       GestureDetector(
  //         onTap: () {
  //           showDialog(
  //             context: context,
  //             builder: (context) {
  //               return imageePicker();
  //             },
  //           );
  //         },
  //         child: Image.asset('${AppImages.profileimages}add.png', height: 34.h),
  //       )
  //     ],
  //   );
  // }

  Widget imageePicker() {
    return SimpleDialog(
      title: Text(getLabel(select_choice)),
      children: [
        ListTile(
          onTap: () async {
            Navigator.pop(context);
            final XFile? photo =
                await _picker.pickImage(source: ImageSource.camera);
            path = photo!.path;
            // uploadProfilePictureAPI();
            setState(() {});
          },
          title: Text(getLabel(camera)),
          leading: const Icon(Icons.camera_alt),
        ),
        ListTile(
          onTap: () async {
            Navigator.pop(context);
            final XFile? photo =
                await _picker.pickImage(source: ImageSource.gallery);
            path = photo!.path;
            // uploadProfilePictureAPI();
            setState(() {});
          },
          title: Text(getLabel(gallery)),
          leading: const Icon(Icons.photo),
        )
      ],
    );
  }

  Widget profileText() {
    return Column(
      children: [
        AppText(
          text: PrefObj.preferences!.get(PrefKeys.FullName).toString(),
          fontWeight: FontWeight.w500,
          fontsize: 22.sp,
          color: AppColor.blackcolor,
        ),
        sizeBoxHeight(8.h),
        AppText(
          text: PrefObj.preferences!.get(PrefKeys.MobileNumber).toString(),
          fontWeight: FontWeight.w500,
          fontsize: 14.sp,
          color: AppColor.graytextcolor,
        ),
      ],
    );
  }

  // final MultiSelectController<User> _controller = MultiSelectController();
  //
  // final List<ValueItem> _selectedOptions = [];

  Widget occupationDropdown(
      AsyncSnapshot<GetUserPersonalDetailsModel> userData) {
    return showDropDown(
      hint: getLabel(select_occupation),
      dropdownList: occupationDropdownList,
      selectedItem: userData.data?.data?[0].occupation ?? '',
      onSelectionChanged: (selectedValue) {
        setState(() {
          occupationValue = selectedValue;
        });
      },
    );
  }

  Widget qualification(AsyncSnapshot<GetUserPersonalDetailsModel> userData) {
    return showDropDown(
      hint: getLabel(select_qualification),
      dropdownList: qualificationDropdownList,
      selectedItem: userData.data?.data?[0].qualification ?? '',
      onSelectionChanged: (selectedValue) {
        setState(() {
          qualificationValue = selectedValue;
        });
      },
    );
  }

  Widget income(AsyncSnapshot<GetUserPersonalDetailsModel> userData) {
    return showDropDown(
      hint: getLabel(select_income),
      dropdownList: incomeDropdownList,
      selectedItem: userData.data?.data?[0].income ?? '',
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
              String formattedDate = DateFormat('dd/MM/yyyy').format(newDate);
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

  Widget pinTextfiled(
      AsyncSnapshot<GetUserPersonalDetailsModel>
          getUserPersonalDetailssnapshot) {
    return StreamBuilder<GetCityPincodeModel>(
        stream: getCityPincodeBloc.getCityPincodeStream,
        builder: (context,
            AsyncSnapshot<GetCityPincodeModel> getCityPincodesnapshot) {
          if (isSecond) {
            String? initialState = getCityPincodesnapshot.data?.data?.state;
          String? initialDistrict = getCityPincodesnapshot.data?.data?.district;
            statecontroller.text = initialState ?? '';
          districtcontroller.text = initialDistrict!;
          }

          return Column(
            children: [
              AppTextFormField(
                  label: getLabel(pincode),
                  validator: pincodeValidate,
                  hint: getLabel(enter_pin),
                  inputAction: TextInputAction.next,
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                  controller: pincontroller,
                  onChanged: (value) {
                    if (pincontroller.text.length == 6) {
                      isSecond = true;
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
                    cityValue = selectedValue;
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
              Container(
                color: const Color(0xffe3e1e1),
                child: AppTextFormField(
                  label: getLabel(state),
                  validator: stateValidate,
                  readOnly: true,
                  inputAction: TextInputAction.next,
                  hint: getLabel(enter_state),
                  controller: statecontroller,
                  onChanged: (value) {
                    setState(() {
                      getUserPersonalDetailssnapshot.data?.data?[0].state =
                          value;
                      statecontroller.text = value;
                    });
                  },
                ),
              ),
            ],
          );
        });
  }

  Widget editButton() {
    return AppButton(
        color: AppColor.bluecolor,
        onPress: () {
          onPersonalDetailsAPI();
        },
        text: getLabel(update_personal_details));
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
            statecontroller.text,
            districtcontroller.text,
            _isChecked == "true",
            pincontroller.text,
            apiDateFormate.toString());
    Loader().hideLoader(context);
    if (ispersonaldetails.success == true) {
      Navigator.pop(context);
      widget.onclose();
      uploadProfilePictureAPI();
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColor.bluecolor,
      //   content: AppText(
      //     text: 'Personal details updated successfully',
      //     fontWeight: FontWeight.w600,
      //     fontsize: 16.sp,
      //     color: AppColor.whitecolor,
      //   ),
      // ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.bluecolor,
        content: AppText(
          text: ispersonaldetails.message.toString(),
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
      // print("Failed");
    }
  }

  dynamic uploadProfilePictureAPI() async {
    // Loader().showLoader(context);
    final dynamic isuploadprofilepicture =
        await _repository.onUploadProfilePicture(path);
    // Loader().hideLoader(context);

    if (isuploadprofilepicture.success == true) {
      PrefObj.preferences!
          .put(PrefKeys.ProfileImage, isuploadprofilepicture.data!.iconUrl);

      widget.onclose();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.bluecolor,
        content: AppText(
          text: getLabel(personal_details_updated_successfully),
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   backgroundColor: AppColor.bluecolor,
      //   content: AppText(
      //     text: isuploadprofilepicture.message.toString(),
      //     fontWeight: FontWeight.w600,
      //     fontsize: 16.sp,
      //     color: AppColor.whitecolor,
      //   ),
      // ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: AppText(
            text: isuploadprofilepicture.message.toString(),
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ),
      );
    }
    // Loader().hideLoader(context);
  }
}

// class User {
//   final String name;
//   final int id;
//
//   User({required this.name, required this.id});
//
//   @override
//   String toString() {
//     return 'User(name: $name, id: $id)';
//   }
// }
