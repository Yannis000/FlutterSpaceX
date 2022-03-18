

import 'package:dio/dio.dart';
import 'package:flutter_space_x/core/model/launch.dart';
import 'package:flutter_space_x/core/model/launchpad.dart';
import 'package:injectable/injectable.dart';

import '../model/company.dart';
import '../model/crew.dart';

@singleton
class ApiManager{
  List<Launch>? upcomingLaunches;
  List<Launch>? pastlaunches;
  List<Crew>? crewMembers;
  Company? companyInformation;
  List<Launchpad>? launchpads;

  var dio = Dio();

  ApiManager(){
    dio.options.baseUrl = "https://api.spacexdata.com/v4";
  }

  ///LAUNCHES
  List<Launch>? parseLaunches(List<dynamic>? json){
    if(json == null){
      return null;
    }
    List<dynamic> jsonArray = json;
    return jsonArray.map((json) => Launch.fromJson(json)).toList();
  }

  Future<List<Launch>?> getUpcomingLaunches() async{
    try{
      upcomingLaunches = await dio
          .get("/launches/upcoming").then((response) => parseLaunches(response.data));
      return upcomingLaunches;
    }catch (e){
      print("error : $e");
    }
  }

  Future<List<Launch>?> getPastsLaunches() async{
    try{
      pastlaunches = await dio
          .get("/launches/past").then((response) => parseLaunches(response.data));
      return pastlaunches;
    }catch (e){
      print("error : $e");
    }
  }

  ///CREW MEMBERS
  List<Crew>? parseCrewMembers(List<dynamic>? json){
    if(json == null){
      return null;
    }
    List<dynamic> jsonArray = json;
    return jsonArray.map((json) => Crew.fromJson(json)).toList();
  }

  Future<List<Crew>?> getAllCrewMembers() async{
    try{
      crewMembers = await dio
          .get("/crew").then((response) => parseCrewMembers(response.data));
      return crewMembers;
    }catch (e){
      print("error : $e");
    }
  }

  ///SPACEX INFORMATIONS
  Company? parseCompanyInformation(Map<String, dynamic>? json){
    if(json == null){
      return null;
    }
    return Company.fromJson(json);
  }

  Future<Company?> getCompanyInformation() async{
    try{
      companyInformation = await dio
          .get("/company").then((response) => parseCompanyInformation(response.data));
      return companyInformation;
    }catch (e){
      print("error : $e");
    }
  }


  ///LAUNCHPADS
  List<Launchpad>? parseLaunchpad(List<dynamic>? json){
    if(json == null){
      return null;
    }
    List<dynamic> jsonArray = json;
    return jsonArray.map((json) => Launchpad.fromJson(json)).toList();
  }

  Future<List<Launchpad>?> getAllLaunchpad() async{
    try{
      launchpads = await dio
          .get("/launchpads").then((response) => parseLaunchpad(response.data));
      return launchpads;
    }catch (e){
      print("error : $e");
    }
  }
}