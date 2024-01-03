import '../api/appLabel/app_label_service.dart';

String? validateMobile(String? value) {
  if (value!.length != 10) {
    return getLabel(mobile_number_must_be_of_10_digit);
  } else {
    return null;
  }
}



String? validatemobile(String? value) {
  if (value!.length != 10) {
    return getLabel(mobile_number_must_be_of_10_digit);
  } else {
    return null;
  }
}

String? validatePancard(String? value) {
  if (value!.length != 10) {
    return getLabel(please_enter_valid_pan_number);
  } else {
    return null;
  }
}

String? nameasPanvalidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(please_enter_name_as_in_pan);
  } else {
    return null;
  }
}

String? accountnumvalidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(please_enter_account_number);
  } else {
    return null;
  }
}

String? vpavalidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(please_enter_vpa);
  } else {
    return null;
  }
}

String? namevalidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(please_enter_fetch_name);
  } else {
    return null;
  }
}

String? ifsccodevalidate(String? value) {
  if (value!.length != 11) {
    return getLabel(enter_ifsc_code);
  } else {
    return null;
  }
}

String? validateAadharard(String? value) {
  if (value!.length != 14) {
    return getLabel(enter_aadhar_number);
  } else {
    return null;
  }
}

String? validatecaptcha(String? value) {
  if (value!.isEmpty) {
    return getLabel(enter_captcha);
  } else {
    return null;
  }
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return getLabel(please_enter_valid_email_address);
  } else {
    return null;
  }
}

//==============================email validation ======================================//
String? validatemail(String? value) {
  String pattan =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regExp = RegExp(pattan);
  if (value == null || value.isEmpty || !regExp.hasMatch(value)) {
    return getLabel(please_enter_valid_email_address);
  } else {
    return null;
  }
}

String? firstnameValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(enter_first_name);
  }

  return null;
}

String? lastnameValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(enter_last_name);
  }

  return null;
}

String? emtermpinValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(enter_m_pin);
  }

  return null;
}

String? reemtermpinValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(re_enter_m_pin);
  }

  return null;
}

String? pincodeValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(enter_pincode);
  }

  return null;
}

String? cityValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(enter_city);
  }

  return null;
}

String? stateValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(enter_state);
  }

  return null;
}

String? districtValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(enter_district);
  }

  return null;
}

String? fullnameValidate(String? value) {
  if (value == null || value.isEmpty) {
    return getLabel(enter_full_name);
  }

  // Regular expression to match only alphabets
  RegExp regex = RegExp(r'^[a-zA-Z]+$');

  if (!regex.hasMatch(value)) {
    return getLabel(enter_full_name);
  }

  return null;
}


// String? fullnameValidate(String? value) {
//   if (value!.isEmpty) {
//     return getLabel(enter_full_name);
//   }
//
//   return null;
// }

String? birthdateValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(enter_birthdate);
  }

  return null;
}

String? passwordValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(please_enter_password);
  }

  return null;
}

String? confrompasswordValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(enter_conform_new_password);
  }

  return null;
}

String? mobotpValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(please_enter_otp);
  }

  return null;
}

String? selectCorrectDOB(String? value) {
  if (value!.isEmpty) {
    return getLabel(select_correct_date_of_birth);
  }

  return null;
}

String? referralValidate(String? value) {
  if (value!.isEmpty) {
    return getLabel(enter_referral_code);
  }

  return null;
}