import 'dart:convert';

import 'package:finjoy_app/api/const/config.dart';
import 'package:http/http.dart' as http;

class AppLabels {
  static Map<String, String> labels = {};

  static Future<void> fetchData(String language) async {
    final response =
        await http.get(Uri.parse('${Config.appLabelUrl}$language'));
    // final response = await http.get(Uri.parse('${Config.appLabelUrl}Hindi'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['success']) {
        labels = Map<String, String>.from(data['data']);
      } else {
        throw Exception('Failed to fetch data');
      }
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

String getLabel(String key) {
  return AppLabels.labels[key] ?? 'Label not found';
}

String copy = 'copy';
String fill_all_the_details_mentioned_below =
    'fill_all_the_details_mentioned_below';
String site_performance = 'site_performance';
String hi = 'hi';
String sort_by = 'sort_by';
String yet_to_start = 'yet_to_start';
String marketing = 'marketing';
String enter_birthdate = 'enter_birthdate';
String txt_2_5_lakhs = 'txt_2_5_lakhs';
String no = 'no';
String txt_continue = 'txt_continue';
String done = 'done';
String enter_city = 'enter_city';
String enter_the_otp_sent_to = 'enter_the_otp_sent_to';
String fetch_and_continue = 'fetch_and_continue';
String recent_transfer = 'recent_transfer';
String phone_number = 'phone_number';
String home = 'home';
String graduation = 'graduation';
String txt_91 = 'txt_91';
String please = 'please';
String enter_aadhar_number = 'enter_aadhar_number';
String download = 'download';
String last_updated = 'last_updated';
String analytics = 'analytics';
String sell_and_earn = 'sell_and_earn';
String search_by_name = 'search_by_name';
String share_with_customer = 'share_with_customer';
String check_your_credit_score_from_here = 'check_your_credit_score_from_here';
String retired = 'retired';
String please_enter_valid_pan_number = 'please_enter_valid_pan_number';
String status = 'status';
String enter_first_name = 'enter_first_name';
String today = 'today';
String accounts_opened = 'accounts_opened';
String working_professional = 'working_professional';
String enter_account_number = 'enter_account_number';
String no_internet = 'no_internet';
String manage_your_profile_from_here = 'manage_your_profile_from_here';
String sales_and_marketing_executive = 'sales_and_marketing_executive';
String recommended_offers = 'recommended_offers';
String hello_welcome_to_finjoy = 'hello_welcome_to_finjoy';
String name = 'name';
String lead_related = 'lead_related';
String txt_0_2_lakhs = 'txt_0_2_lakhs';
String photos = 'photos';
String employment = 'employment';
String please_enter_fetch_name = 'please_enter_fetch_name';
String pending_payments = 'pending_payments';
String enter_ifsc_code = 'enter_ifsc_code';
String camera = 'camera';
String salaried = 'salaried';
String finjoy_briefcase = 'finjoy_briefcase';
String manage_your_store_from_here = 'manage_your_store_from_here';
String help_support = 'help_support';
String log_out = 'log_out';
String add_customer = 'add_customer';
String manage_visiting_card_from_here = 'manage_visiting_card_from_here';
String view_course = 'view_course';
String enter_last_name = 'enter_last_name';
String month_subscription = 'month_subscription';
String email_id = 'email_id';
String my_customers = 'my_customers';
String next = 'next';
String no_income = 'no_income';
String attempts_remaining = 'attempts_remaining';
String it_services = 'it_services';
String type = 'type';
String ekyc__successfully_verified = 'ekyc__successfully_verified';
String pending = 'pending';
String no_internet_connection = 'no_internet_connection';
String kyc_verification = 'kyc_verification';
String select_occupation = 'select_occupation';
String confirm = 'confirm';
String passwords_do_not_match = 'passwords_do_not_match';
String txt_12th_pass = 'txt_12th_pass';
String finjoy_registration = 'finjoy_registration';
String verify_your_pan_details = 'verify_your_pan_details';
String pan_number = 'pan_number';
String transfers = 'transfers';
String invalid_item = 'invalid_item';
String aadhar_register_number = 'aadhar_register_number';
String general_enquires = 'general_enquires';
String courses = 'courses';
String enter_pincode = 'enter_pincode';
String he_she_starts_selling_on_finjoy = 'he_she_starts_selling_on_finjoy';
String select_city = 'select_city';
String email_us = 'email_us';
String my_wallet = 'my_wallet';
String instant_cash_withdrawal = 'instant_cash_withdrawal';
String bank_details_verified_successfully =
    'bank_details_verified_successfully';
String refer_and_earn = 'refer_and_earn';
String bank_details = 'bank_details';
String terms_and_conditions = 'terms_and_conditions';
String service = 'service';
String you_are_disconnected_from_the_internet =
    'you_are_disconnected_from_the_internet';
String sales_earning = 'sales_earning';
String insurance_agent_advisor = 'insurance_agent_advisor';
String select_qualification = 'select_qualification';
String wait_time_2_3_mins = 'wait_time_2_3_mins';
String personal_information = 'personal_information';
String privacy_policy = 'privacy_policy';
String need_help = 'need_help';
String enquires = 'enquires';
String are_you_sure_you_want_to_logout = 'are_you_sure_you_want_to_logout';
String wallet = 'wallet';
String earn_upto = 'earn_upto';
String aadhar_captcha = 'aadhar_captcha';
String please_check_your_internet = 'please_check_your_internet';
String skip_for_now = 'skip_for_now';
String real_estate_agent = 'real_estate_agent';
String please_enter_valid_email_address = 'please_enter_valid_email_address';
String required_field = 'required_field';
String ifsc_code = 'ifsc_code';
String support_and_faqs = 'support_and_faqs';
String more_than_10_lakhs = 'more_than_10_lakhs';
String go_to_my_customers = 'go_to_my_customers';
String my_referral_id = 'my_referral_id';
String enter_conform_new_password = 'enter_conform_new_password';
String scope_of_improvement__keep_sharing_the_website_link =
    'scope_of_improvement__keep_sharing_the_website_link';
String training_registration_complete = 'training_registration_complete';
String select_income = 'select_income';
String please_enter_name_as_in_pan = 'please_enter_name_as_in_pan';
String enter_current_m_pin = 'enter_current_m_pin';
String enter_mobile_number = 'enter_mobile_number';
String filter = 'filter';
String bank_verification = 'bank_verification';
String edit = 'edit';
String refer_finjoy_app_through_link = 'refer_finjoy_app_through_link';
String mobile_number_must_be_of_10_digit = 'mobile_number_must_be_of_10_digit';
String vehicle_enquires = 'vehicle_enquires';
String share_content = 'share_content';
String great_your_internet_connection_is_restored =
    'great_your_internet_connection_is_restored';
String account_number = 'account_number';
String settings = 'settings';
String change_mpin = 'change_mpin';
String call_us = 'call_us';
String txt_5_10_lakhs = 'txt_5_10_lakhs';
String enter_pincode_to_check_card = 'enter_pincode_to_check_card';
String claim_reward = 'claim_reward';
String share = 'share';
String enter_m_pin = 'enter_m_pin';
String account = 'account';
String logoutsuccessfully = 'logoutsuccessfully';
String remind_customer = 'remind_customer';
String your_friend_download_the_app = 'your_friend_download_the_app';
String see_all = 'see_all';
String name_as_in_pan = 'name_as_in_pan';
String change_language = 'change_language';
String my_customer = 'my_customer';
String txt_10th_pass = 'txt_10th_pass';
String fincoins = 'fincoins';
String visit = 'visit';
String influencer = 'influencer';
String otp_verification = 'otp_verification';
String redeemed_from_coins = 'redeemed_from_coins';
String please_enter_vpa = 'please_enter_vpa';
String yes = 'yes';
String reset_m_pin = 'reset_m_pin';
String rate_us = 'rate_us';
String leader_board = 'leader_board';
String website = 'website';
String m_pindo_not_match = 'm_pindo_not_match';
String enter_captcha = 'enter_captcha';
String manage_your_briefcase_from_here = 'manage_your_briefcase_from_here';
String phd = 'phd';
String zero_equity_delivery = 'zero_equity_delivery';
String verify_and_continue = 'verify_and_continue';
String sec = 'sec';
String visiting_card = 'visiting_card';
String people_joined = 'people_joined';
String monthly = 'monthly';
String skip = 'skip';
String verify = 'verify';
String enter_vpa = 'enter_vpa';
String reset = 'reset';
String my_id_card = 'my_id_card';
String more = 'more';
String personal_loans = 'personal_loans';
String training = 'training';
String coins = 'coins';
String re_enter_m_pin = 're_enter_m_pin';
String verify_captcha = 'verify_captcha';
String entrepreneur_business_owner = 'entrepreneur_business_owner';
String weekly = 'weekly';
String how_refer_and_earn_works = 'how_refer_and_earn_works';
String verify_your_bank_details = 'verify_your_bank_details';
String please_enter_account_number = 'please_enter_account_number';
String financial_services = 'financial_services';
String financial_advisor_consultant = 'financial_advisor_consultant';
String saving_account = 'saving_account';
String by_continuing_you_agree_terms_and_conditions_and_privacy_policy =
    'by_continuing_you_agree_terms_and_conditions_and_privacy_policy';
String id_and_visiting_card = 'id_and_visiting_card';
String update_personal_details = 'update_personal_details';
String shop_owner = 'shop_owner';
String total_coins_earned = 'total_coins_earned';
String don_t_receive_code = 'don_t_receive_code';
String select_correct_date_of_birth = 'select_correct_date_of_birth';
String enter_pan_card_number = 'enter_pan_card_number';
String transfer_to_bank = 'transfer_to_bank';
String login = 'login';
String please_enter_otp = 'please_enter_otp';
String re_send = 're_send';
String state = 'state';
String enter_pincode_to_check_card_availability =
    'enter_pincode_to_check_card_availability';
String follow_on_socials = 'follow_on_socials';
String two_wheeler_car_dealer = 'two_wheeler_car_dealer';
String gallery = 'gallery';
String payout = 'payout';
String greeting = 'greeting';
String forgot_your_m_pin = 'forgot_your_m_pin';
String diploma = 'diploma';
String personal_details_updated_successfully =
    'personal_details_updated_successfully';
String enter_state = 'enter_state';
String please_enter_password = 'please_enter_password';
String finjoy = 'finjoy';
String loan = 'loan';
String internet_is_back = 'internet_is_back';
String view_details = 'view_details';
String pincode = 'pincode';
String prefer_not_to_say = 'prefer_not_to_say';
String wait_time_24_48_hrs = 'wait_time_24_48_hrs';
String verify_required_documents = 'verify_required_documents';
String brochures = 'brochures';
String self_employed = 'self_employed';
String history = 'history';
String refresh = 'refresh';
String post_graduation = 'post_graduation';
String please_re_enter_m_pin = 'please_re_enter_m_pin';
String share_on_whatsapp = 'share_on_whatsapp';
String student = 'student';
String referrals_sales = 'referrals_sales';
String total_earning = 'total_earning';
String next_update = 'next_update';
String credit_line = 'credit_line';
String videos = 'videos';
String enter_pin = 'enter_pin';
String enter_full_name = 'enter_full_name';
String investment = 'investment';
String vpa = 'vpa';
String fetch_name = 'fetch_name';
String select_choice = 'select_choice';
String others = 'others';
String goal = 'goal';
String homemaker_housewife = 'homemaker_housewife';
String share_with_network = 'share_with_network';
String know_more = 'know_more';
String notification = 'notification';
String live = 'live';
String earnings = 'earnings';
String details = 'details';

String welcome = 'welcome';
String please_enter_new_m_pin_to_access_app =
    'please_enter_new_m_pin_to_access_app';
String forgot_m_pin = 'forgot_m_pin';
String new_on_platform = 'new_on_platform';
String register_now = 'register_now';
String set_m_pin = 'set_m_pin';
String hello_welcome_and_get_started = 'hello_welcome_and_get_started';
String enter_referral_code = 'enter_referral_code';
String sign_up = 'sign_up';
String poster = 'poster';
String enter_name_as_per_pan_card = 'enter_name_as_per_pan_card';
String enter_pin_code = 'enter_pin_code';
String benefits = 'benefits';
String loans = 'loans';
String paysense_personal_loan = 'paysense_personal_loan';
String no_data_found = 'no_data_found';
String enter_new_m_pin = 'enter_new_m_pin';
String confirm_new_m_pin = 'confirm_new_m_pin';
String set_new_m_pin = 'set_new_m_pin';

String certified_financial_expert = 'certified_financial_expert';
String process = 'process';
String whatsapp = 'whatsapp';
String register = 'register';
String currently_joined = 'currently_joined';
String bank_name = 'bank_name';
String view_list = 'view_list';
String travel_agent = 'travel_agent';
String personal_details_insert_successfully =
    'personal_details_insert_successfully';
String my_profile = 'my_profile';
String kyc = 'kyc';
String how_to_complete_kyc = 'how_to_complete_kyc';
String select_district = 'select_district';
String please_select_state = 'please_select_state';
String sales_achieved = 'sales_achieved';
String pending_earning = 'pending_earning';
String share_link_with_network = 'share_link_with_network';
String grow_and_earn = 'grow_and_earn';
String grow_your_earning = 'grow_your_earning';
String grow_your_earning_description = 'grow_your_earning_description';

String balance = 'balance';
String referral_earning = 'referral_earning';
String withdrawals = 'withdrawals';
String total_withdrawal = 'total_withdrawal';
String last_withdrawal_date = 'last_withdrawal_date';
String transactions_history = 'transactions_history';
String select_date_range_for_transactions =
    'select_date_range_for_transactions';
String transfer_amount = 'transfer_amount';
String sent_successfully_to_your_bank_account =
    'sent_successfully_to_your_bank_account';
String enter_amount = 'enter_amount';
String send_withdrawal_request = 'send_withdrawal_request';
String go_to_details = 'go_to_details';
String select_date_range = 'select_date_range';
String please_select_city = 'please_select_city';
String enter_district = 'enter_district';
String txt_go = 'go';
String enter_email_id = 'enter_email_id';
String customer_details = 'customer_details';
String contact_details = 'contact_details';
