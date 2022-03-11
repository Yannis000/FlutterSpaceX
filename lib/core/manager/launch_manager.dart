
import 'package:intl/intl.dart';

class LaunchManager{

  static final LaunchManager _instance = LaunchManager._internal();

  factory LaunchManager() => _instance;

  LaunchManager._internal();

  String convertDate(String date){
    var strToDateTime = DateTime.parse(date);
    final convertLocal = strToDateTime.toLocal();
    var newFormat = DateFormat("dd-MM-yy hh:mm:ss aaa");
    return newFormat.format(convertLocal);
  }

  int getTimeDifference(int date){
    return date - DateTime.now().millisecondsSinceEpoch;
  }

}