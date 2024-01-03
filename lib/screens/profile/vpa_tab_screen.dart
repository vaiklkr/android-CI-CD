// ignore_for_file: use_build_context_synchronously

import 'package:finjoy_app/api/bank%20kyc/model/insert_vpa_details_model.dart';
import 'package:finjoy_app/api/bank%20kyc/model/verify_vpa_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/appLabel/app_label_service.dart';

enum TextfiledType {
  phonenum,
  email,
  allfiled,
  mintChocolateChip,
}

class VPATab extends StatefulWidget {
  final void Function(bool) onClose;
  const VPATab(
      {super.key,
      required this.tabController,
      required this.onClose
      });
  final TabController tabController;
  

  @override
  State<VPATab> createState() => _VPATabState();
}

class _VPATabState extends State<VPATab> {
  final _repository = Repository();

  TextEditingController vpaController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.only(top: vDefaultPadding * 2),
        child: Column(
          children: [
            textfiled(),
            const Spacer(),
            fetchNutton(),
            sizeBoxHeight(vDefaultPadding * 1.5),
          ],
        ),
      ),
    );
  }

  Widget textfiled() {
    return Column(
      children: [
        AppTextFormField(
          label: getLabel(enter_vpa),
          hint: getLabel(enter_vpa),
          controller: vpaController,
          validator: vpavalidate,
        ),
        sizeBoxHeight(7.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                onVerifyVPAAPI();
              },
              child: AppText(
                text: getLabel(fetch_name),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
                fontsize: 14.sp,
                color: AppColor.textfieldtextcolor,
              ),
            ),
          ],
        ),
        sizeBoxHeight(vDefaultPadding),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.backgreencolor,
              borderRadius: BorderRadius.circular(8.r)),
          child: AppTextFormField(
            label: getLabel(name),
            hint: '',
            readOnly: true,
            controller: nameController,
            validator: namevalidate,
            inputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }

  Widget fetchNutton() {
    return AppButton(
        color: AppColor.bluecolor,
        onPress: () {
          if (_key.currentState!.validate()) {
            onInsertVPADetailsAPI();
          }
        },
        text: getLabel(fetch_and_continue));
  }

  Future<bool> onVerifyVPAAPI() async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final VerifyVPAModel isverifyvpa =
        await _repository.onVerifyVPA(vpaController.text);
    Loader().hideLoader(context);
    if (isverifyvpa.success == true) {
      nameController.text = isverifyvpa.data ?? '';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.bluecolor,
        content: AppText(
          text: isverifyvpa.message ?? '',
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));

      return true;
    } else {
      if (isverifyvpa.success == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isverifyvpa.message ?? '',
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
      }
      return false;
    }
  }

  Future<bool> onInsertVPADetailsAPI() async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final InsertVPADetailsModel isinsertvpadetails = await _repository
        .onInsertVPADetails(vpaController.text, nameController.text);
    if (isinsertvpadetails.success == true) {
      Loader().hideLoader(context);

      widget.tabController.animateTo(1);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.bluecolor,
        content: AppText(
          text: isinsertvpadetails.message ?? '',
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
      return true;
    } else {
      Loader().hideLoader(context);
      if (isinsertvpadetails.success == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isinsertvpadetails.message ?? '',
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
