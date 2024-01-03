// ignore_for_file: non_constant_identifier_names

import 'package:finjoy_app/api/auth/provider/get_city_pincode_provider.dart';
import 'package:finjoy_app/api/auth/provider/get_user_personal_details_provider.dart';
import 'package:finjoy_app/api/auth/provider/login_provider.dart';
import 'package:finjoy_app/api/auth/provider/m_pin_provider.dart';
import 'package:finjoy_app/api/auth/provider/otp_to_reset_mpin_provider.dart';
import 'package:finjoy_app/api/auth/provider/register_email_id_provider.dart';
import 'package:finjoy_app/api/auth/provider/register_mobile_provider.dart';
import 'package:finjoy_app/api/auth/provider/reset_mpin_provider.dart';
import 'package:finjoy_app/api/auth/provider/set_m_pin_provider.dart';
import 'package:finjoy_app/api/auth/provider/sign_up_provider.dart';
import 'package:finjoy_app/api/auth/provider/verify_email_otp_provider.dart';
import 'package:finjoy_app/api/auth/provider/verify_mobile_otp_provider.dart';
import 'package:finjoy_app/api/auth/provider/verify_otp_to_reset_mpin_provider.dart';
import 'package:finjoy_app/api/bank%20kyc/provider/insert_bank_details_provider.dart';
import 'package:finjoy_app/api/bank%20kyc/provider/insert_vpa_details_provider.dart';
import 'package:finjoy_app/api/bank%20kyc/provider/verify_bank_account_provider.dart';
import 'package:finjoy_app/api/bank%20kyc/provider/verify_bank_ifsc_provider.dart';
import 'package:finjoy_app/api/bank%20kyc/provider/verify_vpa_provider.dart';
import 'package:finjoy_app/api/creditcard/provider/get_financial_offerlist_provider.dart';
import 'package:finjoy_app/api/dashboard/provider/get_dashboard_banner_provider.dart';
import 'package:finjoy_app/api/dashboard/provider/get_financial_dashboard_provider.dart';
import 'package:finjoy_app/api/dashboard/provider/get_sell_and_earn_data_provider.dart';
import 'package:finjoy_app/api/finjoy%20story/provider/get_fj_stories_provider.dart';
import 'package:finjoy_app/api/kyc/provider/confirm_pan_provider.dart';
import 'package:finjoy_app/api/kyc/provider/validate_aadhaar_otp_provider.dart';
import 'package:finjoy_app/api/kyc/provider/verify_aadhaar_provider.dart';
import 'package:finjoy_app/api/kyc/provider/verify_captcha_provider.dart';
import 'package:finjoy_app/api/marketing/provider/get_marketing_data_provider.dart';
import 'package:finjoy_app/api/my%20profile/provider/upload_profile_picture_provider.dart';
import 'package:flutter/cupertino.dart';
import '../my customers/provider/customer_detail_provider.dart';
import '../my customers/provider/my_customer_provider.dart';
import '../notification/provider/notifications_list_provider.dart';
import '../reset m pin/provider/reset_mpin_provider.dart';
import 'package:finjoy_app/api/visiting%20card/provider/vistingcard.dart';

import '../auth/provider/personal_details_provider.dart';
import '../creditcard/provider/add_customer_provider.dart';
import '../creditcard/provider/get_financial_offer_detail_provider.dart';
import '../kyc/provider/verify_pan_provider.dart';
import '../my profile/provider/my_profile_menu_provider.dart';
import '../training/provider/training_course_list_provider.dart';
import '../training/provider/training_live_list_provider.dart';
import '../valid mpin menu/provider/valid_mpin_menu.dart';

class Repository {
//========================= Register Mobile Number ===========================//

  final RegisterMobileApi registerMobileApi = RegisterMobileApi();

  Future<dynamic> onRegistermobilenumber(String mobilenumber) =>
      registerMobileApi.onRegistermobileApi(mobilenumber);

//=========================== Verify Mobile OTP ==============================//

  final VerifyMobileOTPApi verifyMobileOTPApi = VerifyMobileOTPApi();

  Future<dynamic> onVerifymobileOTP(String mobilenumber, String mobileOTP) =>
      verifyMobileOTPApi.onVerifymobileotpApi(mobilenumber, mobileOTP);

//=========================== Register Email ID ==============================//

  final RegisterEmailIdApi registerEmailIdApi = RegisterEmailIdApi();

  Future<dynamic> onRagisterEmailId(String mobilenumber, String emailiD) =>
      registerEmailIdApi.onRegisteremailIdApi(mobilenumber, emailiD);

//=========================== Verify Mobile OTP ==============================//

  final VerifyEmailOTPApi verifyEmailOTPApi = VerifyEmailOTPApi();

  Future<dynamic> onVerifyEmailOTP(
          String mobilenumber, String emailID, String emailOTP) =>
      verifyEmailOTPApi.onVerifyemailotpApi(mobilenumber, emailID, emailOTP);

//================================ Sign Up ===================================//

  final SignUpApi signUpApi = SignUpApi();

  Future<dynamic> onSignUp(
    String mobilenumber,
    String emailID,
    String fullname,
    String gender,
      String referral
  ) =>
      signUpApi.onSignUpApi(
        mobilenumber, emailID, fullname,gender,referral
        //  gender
      );

//=============================== Set M Pin ==================================//

  final SetMPinApi setMPinApi = SetMPinApi();

  Future<dynamic> onSetMPin(String pin, String confirmpin) =>
      setMPinApi.onSetMPinApi(pin, confirmpin);

//=============================== M Pin ======================================//

  final MPinApi mPinApi = MPinApi();

  Future<dynamic> onMPin(String mPin) => mPinApi.onMPinApi(mPin);

//============================ Personal Details ==============================//

  final PersonalDetailsApi personalDetailsApi = PersonalDetailsApi();

  Future<dynamic> onPersonalDetails(
          String occupation,
          String qualification,
          String income,
          String city,
          String state,
          String district,
          bool optinforWhatsapp,
          String pincode,
          String dob) =>
      personalDetailsApi.onPersonalDetailsApi(occupation, qualification, income,
          city, state, district, optinforWhatsapp, pincode, dob);

//=========================== Verify PAN Details =============================//

  final VerifyPanApi verifyPanApi = VerifyPanApi();

  Future<dynamic> onVerifyPan(String panNumber) =>
      verifyPanApi.onVerifyPanApi(panNumber);

//=========================== Get City Pincode ===============================//

  final GetCityPincodeApi getCityPincodeApi = GetCityPincodeApi();

  Future<dynamic> onGetCityPincode(String pinCode) =>
      getCityPincodeApi.onGetCityPincodeAPI(pinCode);

//============================= CONFIRM PAN ==================================//

  final ConfirmPanApi confirmPanApi = ConfirmPanApi();

  Future<dynamic> onConfirmPan(String pannumber, String panholdername) =>
      confirmPanApi.onConfirmPanApi(pannumber, panholdername);

//============================= Verify Aadhar ================================//

  final VerifyAadharApi verifyAadharApi = VerifyAadharApi();

  Future<dynamic> onVerifyAadhar(String adhaarnumber) =>
      verifyAadharApi.onVerifyAadharApi(adhaarnumber);

//============================= Verify Captcha ===============================//

  final VerifyCaptchaApi verifyCaptchaApi = VerifyCaptchaApi();

  Future<dynamic> onVerifyCaptcha(String adharIdnum, String sessionId,
          String referenceID, String captchaId) =>
      verifyCaptchaApi.onVerifyCaptchaApi(
          adharIdnum, sessionId, referenceID, captchaId);

//=========================== Verify Aadhar OTP ==============================//

  final VerifyAadharOTPApi verifyAadharOTPApi = VerifyAadharOTPApi();

  Future<dynamic> onVerifyAadharOTP(String adharIdnum, String sessionId,
          String referenceID, String otp) =>
      verifyAadharOTPApi.onVerifyAadharOTPApi(
          adharIdnum, sessionId, referenceID, otp);

//================================ Login API =================================//

  final LoginApi loginApi = LoginApi();

  Future<dynamic> onLogin(String mobileNumber, String mPin) =>
      loginApi.onLoginApi(mobileNumber, mPin);

//========================== Verify Bank Account =============================//

  final VerifyBankAccountApi verifyBankAccountApi = VerifyBankAccountApi();

  Future<dynamic> onVerifyBankAccount(String accountnum) =>
      verifyBankAccountApi.onVerifyBankAcccountApi(accountnum);

//========================= Verify Bank Name IFSC ============================//

  final VerifyBankNameIFSCApi verifyBankNameIFSCApi = VerifyBankNameIFSCApi();

  Future<dynamic> onVerifyBankNameIFSC(String ifscnum) =>
      verifyBankNameIFSCApi.onVerifyBankNameIFSCApi(ifscnum);

//=============================== Verify VPA =================================//

  final VerifyVPAApi verifyVPAApi = VerifyVPAApi();

  Future<dynamic> onVerifyVPA(String vpaNum) =>
      verifyVPAApi.onVerifyVPAApi(vpaNum);

//============================= Insert VPA Details ===========================//

  final InsertVPADetailsApi insertVPADetailsApi = InsertVPADetailsApi();

  Future<dynamic> onInsertVPADetails(String vpaNum, String vpaHolderName) =>
      insertVPADetailsApi.onInsertVPADetailsApi(vpaNum, vpaHolderName);

//========================== Insert Bank Details =============================//

  final InsertBankDetailssApi insertBankDetailssApi = InsertBankDetailssApi();

  Future<dynamic> onInsertBankDetails(String accNum, String accHolderName,
          String ifscNum, String bankName) =>
      insertBankDetailssApi.onInsertBankDetailsApi(
          accNum, accHolderName, ifscNum, bankName);

//======================== Get User Personal Details =========================//

  final GetUserPersonalDetailsApi getUserPersonalDetailsApi =
      GetUserPersonalDetailsApi();

  Future<dynamic> onGetUserPersonalDetails() =>
      getUserPersonalDetailsApi.onGetUserPersonalDetailsApi();

//===================== Get Financial Dashboard Object  ======================//

  final GetFinancialDashboardApi getFinancialDashboardApi =
      GetFinancialDashboardApi();

  Future<dynamic> onGetFinancialDashboard() =>
      getFinancialDashboardApi.onGetFinancialDashboardApi();

//========================= Get Sell And Earn Data  ==========================//

  final GetSellAnEarnDataApi getSellAnEarnDataApi = GetSellAnEarnDataApi();

  Future<dynamic> onSellAndEarnData() =>
      getSellAnEarnDataApi.onGetSellAndEarnDataApi();

//========================== Get Financial Offer List ========================//

  final GetFinancialOfferListApi getFinancialOfferListApi =
      GetFinancialOfferListApi();

  Future<dynamic> onGetFinancialOfferList(
          String offercategoryid, String pinCode) =>
      getFinancialOfferListApi.onGetFinancialOfferListApi(
          offercategoryid, pinCode);

//=========================== Get Dashboard Banner  ==========================//

  final GetDashboardBannerApi getDashboardBannerApi = GetDashboardBannerApi();

  Future<dynamic> onGetDashboardBanner() =>
      getDashboardBannerApi.onGetDashboardBannerApi();

//=============================== Forgot M Pin  ==============================//

  final OTPToResetMPinApi oTPToResetMPinApi = OTPToResetMPinApi();

  Future<dynamic> onOTPToResetMPin(String mobNum) =>
      oTPToResetMPinApi.onOTPToResetMpinApi(mobNum);

//===================== Get Financial Offer Detail ===========================//

  final GetFinancialOfferDetailApi getFinancialOfferDetailApi =
      GetFinancialOfferDetailApi();

  Future<dynamic> onGetFinancialOfferDetail(String offerId) =>
      getFinancialOfferDetailApi.onGetFinancialOfferDetailApi(offerId);

//============================= Get My Profile Menu ==========================//

  final GetMyProfileMenuApi getMyProfileMenuApi = GetMyProfileMenuApi();

  Future<dynamic> onMyProfileMenu() =>
      getMyProfileMenuApi.onGetMyProfileMenuApi();

//============================ Valid M Pin ===================================//

  final ValidMpinMenuApi validMpinApi = ValidMpinMenuApi();

  Future<dynamic> onValidMipin(String currentMpin) =>
      validMpinApi.onValidMpinMenuApi(currentMpin);

//============================= ResetMPIN Menu ===============================//
  final GetResetMPINApi getResetMPINApi = GetResetMPINApi();

  Future<dynamic> ongetResetMPINApi(String Mpin, confirmMpin) =>
      getResetMPINApi.onResetMPINApi(Mpin, confirmMpin);

//============================== Add Customer ================================//

  final AddCustomerApi addCustomerApi = AddCustomerApi();

  Future<dynamic> onAddCustomerApi(String customermobilenumber, String pannumber, String nameasperpan, String customermailid,
      String pincode, String state, String district, String city, String offerid, String panverificationid) =>
      addCustomerApi.onAddCustomerApi(
          customermobilenumber, pannumber, nameasperpan, customermailid, pincode, state, district, city, offerid, panverificationid);

//=================== Verify OTP To Reset M Pin ==============================//

  final VerifyOTPtoResetMPinApi verifyOTPtoResetMPinApi =
      VerifyOTPtoResetMPinApi();

  Future<dynamic> onVerifyOTPtoResetMPin(String mobileNumber, String otpNum) =>
      verifyOTPtoResetMPinApi.onVerifyOTPtoResetMPinApi(mobileNumber, otpNum);

//================================  Reset M Pin ==============================//

  final ResetMPinApi resetMPinApi = ResetMPinApi();

  Future<dynamic> onResetMPin(
          String pinNum, String confirmMPin, String mobileNumber) =>
      resetMPinApi.onResetMPinApi(pinNum, confirmMPin, mobileNumber);

//=============================  Get FJ Stories ==============================//

  final GetFJStoriesApi getFJStoriesApi = GetFJStoriesApi();

  Future<dynamic> onGetFJStories() => getFJStoriesApi.onGetFJStoriesAPI();

//========================== Visiting Card  ==================================//

  final VisitingCardApi visitingCardApi = VisitingCardApi();

  Future<dynamic> onVisitingCard() => visitingCardApi.onVisitingCardApi();

//======================== Upload Profile Picture ============================//

  final UploadProfilePictureApi uploadProfilePictureApi =
      UploadProfilePictureApi();

  Future<dynamic> onUploadProfilePicture(String profilePicture) =>
      uploadProfilePictureApi.onUploadProfilePictureApi(profilePicture);

//=========================== Get Marketing Data =============================//

  final GetMarketingDataApi getMarketingDataApi = GetMarketingDataApi();

  Future<dynamic> onGetMarketingData() =>
      getMarketingDataApi.onGetMarketingDataApi();

//=========================== Get Training Data =============================//

  final GetTrainingCourseDataApi getTrainingCourseDataApi = GetTrainingCourseDataApi();

  Future<dynamic> onGetTrainingCourseData() =>
      getTrainingCourseDataApi.onGetTrainingCourseDataApi();

//=========================== Get Training Data =============================//

  final GetTrainingLiveDataApi getTrainingLiveDataApi = GetTrainingLiveDataApi();

  Future<dynamic> onGetTrainingLiveData() =>
      getTrainingLiveDataApi.onGetTrainingLiveDataApi();

  //========================== Get My Customer List ========================//

  final GetMyCustomerListApi  getMyCustomerListApi =
  GetMyCustomerListApi();

  Future<dynamic> onGetMyCustomerListApi() =>
      getMyCustomerListApi.onGetMyCustomerListApi();

  //========================== Get Notifications List ========================//

  final GetNotificationsListApi  getNotificationsListApi =
  GetNotificationsListApi();

  Future<dynamic> onGetNotificationsListApi() =>
      getNotificationsListApi.onNotificationsListApi();

  //========================== Get Customer Detail ========================//

  final CustomerDetailApi  getCustomerDetailApi =
  CustomerDetailApi();

  Future<dynamic> onCustomerDetailApi(String customerId) =>
      getCustomerDetailApi.onCustomerDetailApi(customerId);

}
