import '../helpers/custom_trace.dart';

class Foloosi {
  // ignore: non_constant_identifier_names
  String redirect_url;
  // ignore: non_constant_identifier_names
  double transaction_amount;
  // ignore: non_constant_identifier_names
  String currency;
  // ignore: non_constant_identifier_names
  String customer_name;
  // ignore: non_constant_identifier_names
  String customer_email;
  // ignore: non_constant_identifier_names
  String customer_mobile;
  // ignore: non_constant_identifier_names
  String customer_address;
  // ignore: non_constant_identifier_names
  String customer_city;

  Foloosi();

  Foloosi.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      redirect_url = jsonMap['redirect_url'].toString();
      transaction_amount = jsonMap['transaction_amount'].toInt();
      currency = jsonMap['currency'].toString();
      customer_name = jsonMap['customer_name'].toString();
      customer_email = jsonMap['customer_email'].toString();
      customer_mobile = jsonMap['customer_mobile'].toString();
      customer_address = jsonMap['customer_address'].toString();
      customer_city = jsonMap['customer_city'].toString();
    } catch (e) {
      redirect_url = '';
      transaction_amount = 0;
      currency = '';
      customer_name = '';
      customer_email = '';
      customer_mobile = '';
      customer_address = '';
      customer_city = '';
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["redirect_url"] = redirect_url;
    map["transaction_amount"] = transaction_amount;
    map["currency"] = currency;
    map["customer_name"] = customer_name;
    map["customer_email"] = customer_email;
    map["customer_mobile"] = customer_mobile;
    map["customer_address"] = customer_address;
    map["customer_city"] = customer_city;
    return map;
  }
}
