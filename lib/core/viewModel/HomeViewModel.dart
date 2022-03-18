import 'package:flutter/material.dart';
import 'package:flutter_space_x/core/manager/database_manager.dart';
import 'package:flutter_space_x/core/manager/locator.dart';
import 'package:flutter_space_x/core/model/launch.dart';

class HomeViewModel extends ChangeNotifier{

  Launch? launch;
  String? dateText;

  HomeViewModel();

}