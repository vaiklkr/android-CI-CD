import 'package:flutter/material.dart';

import '../screens/home/credit card/add_customer_screen.dart';
import '../screens/home/credit card/credit_card_details_screen.dart';
import '../screens/home/credit card/details_tab.dart';

class RouteUtils {
  static String offerId = "offerId";
  static String offerTitle = "offerTitle";

  static String creditCardDetailsScreen = 'CreditCardDetailsScreen';
  static String addCustomerScreen = 'AddCustomerScreen';
  static String detailsTab = 'DetailsTab';
  late final String fullName;

  static Map<String, Widget Function(BuildContext)> routes() {
    return {
      creditCardDetailsScreen: (context) => const CreditCardDetailsScreen(),
      addCustomerScreen: (context) => const AddCustomerScreen(),
      detailsTab: (context) => const DetailsTab(),
    };
  }
}
