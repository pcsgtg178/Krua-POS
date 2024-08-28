import 'package:intl/intl.dart';

import 'package:krua_pos/constants/constants.dart';

String getTxnDate(){
  var now = DateTime.now();
  return DateFormat(Constants.DATE_FORMAT).format(now);
}

String getBusDate(){
  var now = DateTime.now();
  return DateFormat("yyyyMMdd").format(now);
}