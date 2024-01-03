// ignore_for_file: use_build_context_synchronously

import 'package:finjoy_app/api/bank%20kyc/model/insert_bank_details_model.dart';
import 'package:finjoy_app/api/bank%20kyc/model/verify_bank_account_model.dart';
import 'package:finjoy_app/api/bank%20kyc/model/verify_bank_ifsc_model.dart';
import 'package:finjoy_app/api/repository/repository.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/core/app_validation.dart';
import 'package:finjoy_app/screens/profile/kyc_success_screen.dart';
import 'package:finjoy_app/widgets/custom_button.dart';
import 'package:finjoy_app/widgets/custom_textfromfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../api/appLabel/app_label_service.dart';

class AccountTab extends StatefulWidget {
  final void Function(bool) onClose;

  const AccountTab({super.key, required this.onClose});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  final _repository = Repository();

  TextEditingController accnumController = TextEditingController();
  TextEditingController ifsccodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController banknameController = TextEditingController();
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
            sizeBoxHeight(vDefaultPadding),
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
          label: getLabel(account_number),
          hint: getLabel(enter_account_number),
          keyboardType: TextInputType.number,
          controller: accnumController,
          validator: accountnumvalidate,
        ),
        sizeBoxHeight(7.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                onVerifyBankAccoutAPI();
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
        AppTextFormField(
            label: getLabel(ifsc_code),
            hint: getLabel(enter_ifsc_code),
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            controller: ifsccodeController,
            maxLength: 11,
            validator: ifsccodevalidate,
            onChanged: (value) {
              if (value.length == 11) {
                onVerifyBankNameIFSCAPI();
                setState(() {});
              } else {
                if (value.length == 10) {
                  onVerifyBankNameIFSCAPI();
                  setState(() {});
                }
              }
            }),
        sizeBoxHeight(vDefaultPadding),
        Container(
          // height: 64.h,
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
        sizeBoxHeight(vDefaultPadding),
        Container(
          height: 64.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.backgreencolor,
              borderRadius: BorderRadius.circular(8.r)),
          child: AppTextFormField(
            label: getLabel(bank_name),
            hint: '',
            readOnly: true,
            controller: banknameController,
            inputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
          ),
        ),
      ],
    );
  }

  Widget viewlistButton() {
    return AppButton(
        color: AppColor.bluecolor, onPress: () {}, text: getLabel(view_list));
  }

  Widget fetchNutton() {
    return AppButton(
        color: AppColor.bluecolor,
        onPress: () {
          if (_key.currentState!.validate()) {
            onInsertBankDetailsAPI();
          }
        },
        text: getLabel(fetch_and_continue));
  }

  Future<bool> onVerifyBankAccoutAPI() async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final VerifyBankAccountModel isverifybanaccount =
        await _repository.onVerifyBankAccount(accnumController.text);
    Loader().hideLoader(context);
    if (isverifybanaccount.success == true) {
      nameController.text = isverifybanaccount.data ?? '';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.bluecolor,
        content: AppText(
          text: isverifybanaccount.message ?? '',
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
      return true;
    } else {
      if (isverifybanaccount.success == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isverifybanaccount.message ?? '',
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
      }
      return false;
    }
  }

  Future<bool> onVerifyBankNameIFSCAPI() async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final VerifyBankNameByIFSCModel isverifybanknameifsc =
        await _repository.onVerifyBankNameIFSC(ifsccodeController.text);
    Loader().hideLoader(context);
    if (isverifybanknameifsc.success == true) {
      banknameController.text = isverifybanknameifsc.data ?? '';
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.bluecolor,
        content: AppText(
          text: isverifybanknameifsc.message ?? '',
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
      return true;
    } else {
      if (isverifybanknameifsc.success == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isverifybanknameifsc.message ?? '',
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
            color: AppColor.whitecolor,
          ),
        ));
      }
      return false;
    }
  }

  Future<bool> onInsertBankDetailsAPI() async {
    Loader().showLoader(context);
    if (!mounted) return true;
    final InsertBankDetailsModel isinsertbankdetails =
        await _repository.onInsertBankDetails(
            accnumController.text,
            nameController.text,
            ifsccodeController.text,
            banknameController.text);
    if (isinsertbankdetails.success == true) {
      Navigator.push(context, CupertinoPageRoute(
        builder: (context) {
          return BankDetailsSuccessfullyScreen(
            onClose: (value) {
              widget.onClose(value);
              setState(() {});
            },
          );
        },
      ));
      Loader().hideLoader(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColor.bluecolor,
        content: AppText(
          text: isinsertbankdetails.message ?? '',
          fontWeight: FontWeight.w600,
          fontsize: 16.sp,
          color: AppColor.whitecolor,
        ),
      ));
      return true;
    } else {
      Loader().hideLoader(context);
      if (isinsertbankdetails.success == false) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColor.bluecolor,
          content: AppText(
            text: isinsertbankdetails.message ?? '',
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
