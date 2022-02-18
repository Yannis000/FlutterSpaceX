
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
    print(date.toString());
    print(DateTime.now().millisecondsSinceEpoch.toString());
    return date - DateTime.now().millisecondsSinceEpoch;
  }

}