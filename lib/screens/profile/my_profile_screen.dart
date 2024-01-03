// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:finjoy_app/const/behaviour.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/profile/bank_verifaction_screen.dart';
import 'package:finjoy_app/screens/profile/edit_personal_info_screen.dart';
import 'package:finjoy_app/screens/profile/kyc_verifaction_screen.dart';
import 'package:finjoy_app/utils/shared_pref.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:finjoy_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../api/appLabel/app_label_service.dart';

enum BackNavigatorType { myprofile, onnavigate }

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key, required this.navigate});

  final BackNavigatorType navigate;

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _picker = ImagePicker();
  File? imagepick;

  String path = "";
  bool isKYC = false;
  bool isBank = false;

  String profileImg = '';

  @override
  void initState() {
    super.initState();
    profileImg = PrefObj.preferences!.get(PrefKeys.ProfileImage).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                  navigate: BackNavigatorType.myprofile,
                  title: getLabel(my_profile),
                  subtitle: 'Verify required Documents'),
              sizeBoxHeight(vDefaultPadding),
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
                          sizeBoxHeight(20.h),
                          profileText(),
                          sizeBoxHeight(60.h),
                          personalInfo(),
                          sizeBoxHeight(38.h),
                          kycDetails(),
                          sizeBoxHeight(50.h),
                          skipNowButton(),
                          sizeBoxHeight(vDefaultPadding * 2)
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

  Widget profileImageHome() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          height: 132.h,
          width: 132.h,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.blackcolor, width: 1),
    /*image: ,
              path == ""
                  ? profileImg.contains('https://')
                      ? DecorationImage(
                          image: NetworkImage(profileImg), fit: BoxFit.cover)
                      : DecorationImage(
                          image: AssetImage(
                              '${AppImages.profileimages}group.png'),
                          fit: BoxFit.fill)
                  : DecorationImage(
                      image: FileImage(
                        File(path),
                      ),
                      fit: BoxFit.fill),*/
              borderRadius: BorderRadius.circular(100.r)),
          child: profileImage(context, 132.h, AppColor.blackcolor, false),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                return EditPersonalInfoScreen(
                  onclose: () {
                    profileImg = PrefObj.preferences!
                        .get(PrefKeys.ProfileImage)
                        .toString();
                    setState(() {});
                  },
                );
              },
            ));
          },
          child: Image.asset('${AppImages.profileimages}add.png', height: 34.h),
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
        sizeBoxHeight(4.h),
        AppText(
          text: PrefObj.preferences!.get(PrefKeys.MobileNumber).toString(),
          fontWeight: FontWeight.w500,
          fontsize: 14.sp,
          color: AppColor.graytextcolor,
        ),
      ],
    );
  }

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
            setState(() {});
          },
          title: Text(getLabel(gallery)),
          leading: const Icon(Icons.photo),
        )
      ],
    );
  }

  Widget personalInfo() {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                return EditPersonalInfoScreen(
                  onclose: () {
                    profileImg = PrefObj.preferences!
                        .get(PrefKeys.ProfileImage)
                        .toString();
                    setState(() {});
                  },
                );
              },
            ));
          },
          child: Container(
            height: 65.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColor.whitecolor,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 3.r,
                    blurRadius: 3.r,
                    color: Colors.grey.shade200)
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 22.h, bottom: 22.h, right: 27.w, left: 16.w),
              child: Row(
                children: [
                  Image.asset('${AppImages.profileimages}done.png', height: 32.h),
                  sizeBoxWidth(14.w),
                  AppText(
                    text: getLabel(personal_information),
                    fontWeight: FontWeight.w500,
                    fontsize: 16.sp,
                    color: AppColor.blacktextcolor,
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context) {
                            return EditPersonalInfoScreen(
                              onclose: () {
                                profileImg = PrefObj.preferences!
                                    .get(PrefKeys.ProfileImage)
                                    .toString();
                                setState(() {});
                              },
                            );
                          },
                        ));
                      },
                      child: Image.asset('${AppImages.profileimages}edit.png',
                          height: 20.h)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget kycDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: getLabel(kyc),
              fontWeight: FontWeight.w600,
              fontsize: 18.sp,
              color: AppColor.blacktextcolor,
            ),
            GestureDetector(
              onTap: (){

              },
              child: Row(
                children: [
                  Image.asset('${AppImages.profileimages}play.png', height: 22.h),
                  sizeBoxWidth(7.w),
                  AppText(
                    text: getLabel(how_to_complete_kyc),
                    fontWeight: FontWeight.w400,
                    fontsize: 14.sp,
                    color: AppColor.blacktextcolor,
                  ),
                ],
              ),
            ),
          ],
        ),
        sizeBoxHeight(29.h),
        GestureDetector(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                return KYCVerifactionScreen(
                  onClose: (value) {
                    isKYC = value;
                    setState(() {});
                  },
                );
              },
            ));
          },
          child: Container(
            height: 65.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColor.whitecolor,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 3.r,
                    blurRadius: 3.r,
                    color: Colors.grey.shade200)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(vDefaultPadding * 1.2),
              child: Row(
                children: [
                  Image.asset(
                      '${AppImages.profileimages}${isKYC ? 'done' : 'close'}.png',
                      height: 32.h),
                  sizeBoxWidth(14.w),
                  AppText(
                    text: getLabel(kyc_verification),
                    fontWeight: FontWeight.w500,
                    fontsize: 15.sp,
                    color: AppColor.blacktextcolor,
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios_outlined,
                      color: AppColor.blacktextcolor, size: 20.h),
                ],
              ),
            ),
          ),
        ),
        sizeBoxHeight(vDefaultPadding * 2),
        GestureDetector(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(
              builder: (context) {
                return BankVerifactionScreen(
                  onClose: (value) {
                    isBank = value;
                    setState(() {});
                  },
                );
              },
            ));
          },
          child: Container(
            height: 65.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColor.whitecolor,
              boxShadow: [
                BoxShadow(
                    spreadRadius: 3.r,
                    blurRadius: 3.r,
                    color: Colors.grey.shade200)
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(vDefaultPadding * 1.2),
              child: Row(
                children: [
                  Image.asset(
                      '${AppImages.profileimages}${isBank ? 'done' : 'close'}.png',
                      height: 32.h),
                  sizeBoxWidth(vDefaultPadding),
                  AppText(
                    text: getLabel(bank_details),
                    fontWeight: FontWeight.w500,
                    fontsize: 15.sp,
                    color: AppColor.blacktextcolor,
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_forward_ios_outlined,
                      color: AppColor.blacktextcolor, size: 20.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget skipNowButton() {
    return GestureDetector(
      onTap: () {
        PrefObj.preferences!.put(PrefKeys.isKYC, isKYC);
        PrefObj.preferences!.put(PrefKeys.isBank, isBank);
        Navigator.push(context, CupertinoPageRoute(
          builder: (context) {
            return const BottomBarPage();
          },
        ));
      },
      child: Container(
        height: 45.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: AppColor.bluecolor, width: 1)),
        child: Center(
            child: AppText(
          text: getLabel(skip_for_now),
          fontWeight: FontWeight.w500,
          fontsize: 16.sp,
          color: AppColor.bluecolor,
        )),
      ),
    );
  }
}
