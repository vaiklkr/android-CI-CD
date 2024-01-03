// ignore_for_file: constant_identifier_names

import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../api/appLabel/app_label_service.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final Color color;
  final void Function() onPress;
  const AppButton(
      {super.key,
      required this.color,
      required this.onPress,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        color: color,
        height: 56.h,
        elevation: 0,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
        onPressed: onPress,
        child: Text(
          text ?? '',
          style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColor.whitecolor),
        ),
      ),
    );
  }
}

Widget backButton(context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: vDefaultPadding),
      child: Row(
        children: [
          Container(
            height: 41,
            width: 41,
            decoration: BoxDecoration(
                color: AppColor.whitecolor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xffE8ECF4))),
            child: Center(
              child: Image.asset(
                '${AppImages.signupimages}back.png',
                height: 16,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget appBar(context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: Padding(
      padding:
          const EdgeInsets.only(left: vDefaultPadding, top: vDefaultPadding),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: AppColor.whitecolor,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: const Color(0xffE8ECF4))),
            child: Center(
              child: Image.asset(
                '${AppImages.signupimages}back.png',
                height: 16,
              ),
            ),
          ),
          sizeBoxWidth(vDefaultPadding * 1.5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getLabel(personal_information),
                style: GoogleFonts.poppins(
                    color: AppColor.blackcolor,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.w500),
              ),
              sizeBoxHeight(vDefaultSize / 2),
              Text(
                getLabel(fill_all_the_details_mentioned_below),
                style: GoogleFonts.poppins(
                    color: AppColor.graytextcolor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class Loader {
  showLoader(BuildContext context) {
    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80.0),
                  color: Colors.grey.shade100,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0.h),
                  child: const Center(
                    child: CircularProgressIndicator(color: AppColor.bluecolor),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void hideLoader(BuildContext context) {
    Navigator.pop(context);
  }
}

class Widthbutton extends StatelessWidget {
  final String? text;
  final double? width;
  final double? height;
  final BorderRadius? circular;
  final void Function()? onPressed;
  final Color color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const Widthbutton({
    Key? key,
    this.text,
    this.width,
    this.height,
    this.onPressed,
    this.circular,
    this.color = AppColor.backgreencolor,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColor.boxgraycolor,
            offset: Offset(0, 2),
            blurRadius: 2,
          ),
        ],
        color: color,
        borderRadius: circular,
        border: Border.all(color: AppColor.curcolor, width: 1),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text ?? '',
            style: GoogleFonts.poppins(
                color: color == AppColor.backgreencolor
                    ? AppColor.blackcolor
                    : AppColor.orangecolor,
                fontWeight: fontWeight,
                fontSize: fontSize)),
      ),
    );
  }
}
