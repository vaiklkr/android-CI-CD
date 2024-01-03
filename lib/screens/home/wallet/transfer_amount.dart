import 'package:audioplayers/audioplayers.dart';
import 'package:finjoy_app/core/app_color.dart';
import 'package:finjoy_app/core/app_image.dart';
import 'package:finjoy_app/core/app_sized_box.dart';
import 'package:finjoy_app/core/app_text.dart';
import 'package:finjoy_app/screens/home/wallet/balance_transfer_successfull.dart';
import 'package:finjoy_app/widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../api/appLabel/app_label_service.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfromfield.dart';

class TransferAmountScreen extends StatefulWidget {
  const TransferAmountScreen({super.key});

  @override
  State<TransferAmountScreen> createState() => _TransferAmountScreenState();
}

class _TransferAmountScreenState extends State<TransferAmountScreen> {
  TextEditingController amountController = TextEditingController();
  bool isValidationOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [const HomeCustomAppbar(), mainContainer()]));
  }

  Widget mainContainer() {
    return Container(
      margin: EdgeInsets.only(top: vDefaultPadding * 7.h),
      decoration: BoxDecoration(
          color: AppColor.whitecolor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
          )),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 20.w, left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                sizeBoxHeight(50.h),
                sizeBoxHeight(50.h),
                sizeBoxHeight(50.h),
                panTextfiled(),
                sizeBoxHeight(25.h),
                Padding(
                  padding: const EdgeInsets.only(right: 50.0, left: 50.0),
                  child: AppButton(
                      color: AppColor.bluecolor,
                      onPress: () {

                        // Navigator.pop(context);
                        // Navigator.pop(context);

                        // widget.onClose(true);
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context) {
                            return const BalanceTransferSuccessFullyScreen();
                          },
                        ));
                      },
                      text: getLabel(send_withdrawal_request)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget header() {
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
        Expanded(
          child: AppText(
            text: getLabel(transfer_amount),
            fontsize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColor.blacktextcolor,
          ),
        ),
      ],
    );
  }

  Widget panTextfiled() {
    return Padding(
      padding: const EdgeInsets.only(right: 60.0, left: 60.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextFormField(
            controller: amountController,
            keyboardType: TextInputType.phone,
            maxLength: 10,
            textInputAction: TextInputAction.next,
            label: getLabel(enter_amount),
            hint: 'Enter Withdrawal Amount',
          ),
          sizeBoxHeight(20.h),
        ],
      ),
    );
  }
}
