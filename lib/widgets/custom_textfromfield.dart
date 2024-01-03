// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

import '../utils/dropdown_list_item.dart';
import 'customDropDown/multiselect_dropdown.dart';

// class AppTextFormField extends StatelessWidget {
//   final String? hint;
//   final String? label;
//   final Widget? suffixIcon;
//   final TextEditingController? controller;
//   final TextInputType keyboardType;
//   final bool readOnly;
//   final TextInputAction? inputAction;
//   final TextInputAction? textInputAction;

//   final FocusNode? focusNode;
//   final bool obscureText;
//   final int? maxLength;

//   const AppTextFormField({
//     super.key,
//     this.hint,
//     this.label,
//     this.focusNode,
//     this.inputAction,
//     this.maxLength,
//     this.controller,
//     this.textInputAction,
//     this.readOnly = false,
//     this.suffixIcon,
//     this.keyboardType = TextInputType.text,
//     this.obscureText = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 58.h,
//       child: Theme(
//         data: ThemeData(
//             primarySwatch: createCustomMaterialColor(AppColor.bluecolor),
//             inputDecorationTheme: const InputDecorationTheme(
//                 labelStyle: TextStyle(color: Colors.redAccent))),
//         child: TextFormField(
//           controller: controller,
//           maxLength: maxLength,
//           keyboardType: keyboardType,
//           cursorColor: AppColor.bluecolor,
//           obscureText: obscureText,
//           readOnly: readOnly,
//           textInputAction: textInputAction,
//           focusNode: focusNode,
//           decoration: InputDecoration(
//             counterText: '',
//             suffixIcon: suffixIcon,
//             contentPadding: EdgeInsets.fromLTRB(30.w, 24.h, 12.h, 16.w),
//             labelStyle: GoogleFonts.poppins(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w400,
//             ),
//             hintStyle: GoogleFonts.poppins(
//               fontSize: 16.sp,
//               fontWeight: FontWeight.w400,
//               color: AppColor.textfieldtextcolor,
//             ),
//             label: Text(label!),
//             hintText: hint,
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: AppColor.bluecolor),
//               borderRadius: BorderRadius.circular(8.r),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: AppColor.graycolor),
//               borderRadius: BorderRadius.circular(8.r),
//             ),
//             border: OutlineInputBorder(
//               borderSide: const BorderSide(color: AppColor.bluecolor),
//               borderRadius: BorderRadius.circular(8.r),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class AppTextFormField extends StatelessWidget {
  final String? hint;
  final String? label;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final TextInputAction? inputAction;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool obscureText;
  final inputFormatters;
  final int? maxLength;
  final void Function()? onTap;
  final void Function(String)? onsubmite;
  final String? initialValue;
  final String? errorText;
  final TextCapitalization textCapitalization;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator; // Validation function

  const AppTextFormField({
    super.key,
    // Key property was missing in your code
    this.hint,
    this.label,
    this.focusNode,
    this.inputAction,
    this.maxLength,
    this.onChanged,
    this.onsubmite,
    this.inputFormatters,
    this.controller,
    this.initialValue,
    this.errorText,
    this.textInputAction,
    this.onTap,
    this.readOnly = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 58.h,
      child: Theme(
        data: ThemeData(
          primarySwatch: createCustomMaterialColor(AppColor.bluecolor),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.redAccent),
          ),
        ),
        child: TextFormField(
          onTap: onTap,
          controller: controller,
          maxLength: maxLength,
          textCapitalization: textCapitalization,
          onFieldSubmitted: onsubmite,
          initialValue: initialValue,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          cursorColor: AppColor.bluecolor,
          obscureText: obscureText,
          readOnly: readOnly,
          textInputAction: textInputAction,
          focusNode: focusNode,
          decoration: InputDecoration(
            counterText: '',
            errorText: errorText,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.fromLTRB(30.w, 24.h, 12.h, 16.w),
            labelStyle: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            hintStyle: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.textfieldtextcolor,
            ),
            label: Text(label!),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.bluecolor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.graycolor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.bluecolor),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}

MaterialColor createCustomMaterialColor(Color color) {
  Map<int, Color> swatch = {
    50: color.withOpacity(0.1),
    100: color.withOpacity(0.2),
    200: color.withOpacity(0.3),
    300: color.withOpacity(0.4),
    400: color.withOpacity(0.5),
    500: color.withOpacity(0.6),
    600: color.withOpacity(0.7),
    700: color.withOpacity(0.8),
    800: color.withOpacity(0.9),
    900: color.withOpacity(1.0),
  };

  return MaterialColor(color.value, swatch);
}

class AppSearchTextFormField extends StatelessWidget {
  final String? hint;
  final String? label;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final TextInputAction? inputAction;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final inputFormatters;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final bool obscureText;

  const AppSearchTextFormField({
    super.key,
    this.hint,
    this.label,
    this.focusNode,
    this.textInputAction,
    this.inputAction,
    this.controller,
    this.readOnly = false,
    this.suffixIcon,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 55.h,
      child: Theme(
        data: ThemeData(
            primarySwatch: createCustomMaterialColor(const Color(0xffBBBBBB)),
            inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.redAccent))),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          obscureText: obscureText,
          readOnly: readOnly,
          textInputAction: textInputAction,
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          cursorColor: AppColor.blackkcolor,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.fromLTRB(12.w, 16.h, 12.h, 16.w),
            labelStyle: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            hintStyle: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.textfieldtextcolor,
            ),
            label: Text(label!),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffBBBBBB)),
              borderRadius: BorderRadius.circular(17.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffBBBBBB)),
              borderRadius: BorderRadius.circular(17.r),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffBBBBBB)),
              borderRadius: BorderRadius.circular(17.r),
            ),
          ),
        ),
      ),
    );
  }
}

class CreditcardFormField extends StatelessWidget {
  final String? hint;
  final String? label;
  final String? errorText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final TextInputAction? inputAction;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool obscureText;
  final int? maxLength;

  // Validator function for credit card input
  final String? Function(String?)? validator;

  const CreditcardFormField({
    Key? key,
    this.hint,
    this.label,
    this.focusNode,
    this.inputAction,
    this.maxLength,
    this.controller,
    this.textInputAction,
    this.errorText,
    this.readOnly = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator, // Add validator as a parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 60.h,
      child: Theme(
        data: ThemeData(
          primarySwatch: createCustomMaterialColor(AppColor.bluecolor),
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.redAccent),
          ),
        ),
        child: TextFormField(
          inputFormatters: [
            CreditCardFormatter(),
          ],
          controller: controller,
          maxLength: maxLength,
          keyboardType: keyboardType,
          cursorColor: AppColor.bluecolor,
          obscureText: obscureText,
          readOnly: readOnly,
          textInputAction: textInputAction,
          focusNode: focusNode,
          decoration: InputDecoration(
            counterText: '',
            errorText: errorText,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.fromLTRB(30.w, 24.h, 12.h, 16.w),
            labelStyle: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
            hintStyle: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColor.textfieldtextcolor,
            ),
            label: Text(label!),
            hintText: hint,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.bluecolor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.graycolor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColor.bluecolor),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          validator: validator,
        ),
      ),
    );
  }
}

Widget showDropDown(
    {required String hint,
    required List<dynamic> dropdownList,
    required String selectedItem,
    bool readOnly = false,
    required Function(String) onSelectionChanged}) {
  List<ValueItem<dynamic>> selectedItemList = [];
  List<ValueItem<dynamic>> optionsList =
      List.generate(dropdownList.length, (index) {
    String optionLabel = dropdownList[index];
    if (selectedItem.isNotEmpty) {
      selectedItemList.add(ValueItem(
          label: selectedItem,
          value: selectedItem == optionLabel ? index + 1 : null));
    }
    return ValueItem(label: optionLabel, value: index + 1);
  });
  return Container(
    height: 62.0,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: MultiSelectDropDown<dynamic>(
      readOnly: readOnly,
      selectedOptions: selectedItemList,
      showClearIcon: false,
      onOptionSelected: (List<ValueItem<dynamic>> selectedOptions) {
        if (selectedOptions.isNotEmpty) {
          onSelectionChanged(selectedOptions[0].label);
        }
      },
      options: optionsList,
      padding: const EdgeInsets.only(left: 15, right: 15),
      selectionType: SelectionType.single,
      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
      dropdownHeight: 300,
      hintColor: AppColor.textgraycolor,
      hint: hint,
      hintStyle: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColor.textfieldtextcolor,
      ),
      optionTextStyle: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: AppColor.blackcolor,
      ),
      backgroundColor: !readOnly ? Colors.white : const Color(0xffe3e1e1),
      selectedOptionIcon: const Icon(Icons.check_circle),
      borderRadius: 8.r,
      borderColor: Colors.transparent,
    ),
  );
}
