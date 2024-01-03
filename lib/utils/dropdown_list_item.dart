import '../api/appLabel/app_label_service.dart';

List<dynamic> occupationDropdownList = [
  getLabel(financial_advisor_consultant),
  getLabel(insurance_agent_advisor),
  getLabel(entrepreneur_business_owner),
  getLabel(influencer),
  getLabel(real_estate_agent),
  getLabel(travel_agent),
  getLabel(it_services),
  getLabel(sales_and_marketing_executive),
  getLabel(shop_owner),
  getLabel(two_wheeler_car_dealer),
  getLabel(homemaker_housewife),
  getLabel(working_professional),
  getLabel(retired),
  getLabel(student),
  getLabel(others)
];

List<dynamic> qualificationDropdownList = [
  getLabel(txt_10th_pass),
  getLabel(txt_12th_pass),
  getLabel(diploma),
  getLabel(graduation),
  getLabel(post_graduation),
  getLabel(phd),
  getLabel(others)
];

List<dynamic> incomeDropdownList = [
  getLabel(no_income),
  getLabel(txt_0_2_lakhs),
  getLabel(txt_2_5_lakhs),
  getLabel(txt_5_10_lakhs),
  getLabel(more_than_10_lakhs)
];

List<dynamic> cityDropdownList(List<String> cityList) {
  return cityList;
}