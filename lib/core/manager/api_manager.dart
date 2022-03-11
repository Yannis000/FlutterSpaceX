

import 'package:dio/dio.dart';
import 'package:flutter_space_x/core/model/launch.dart';
import 'package:injectable/injectable.dart';

import '../model/company.dart';
import '../model/crew.dart';

@singleton
class ApiManager{
  List<Launch>? launches;
  List<Crew>? crewMembers;
  Company? companyInformation;

  var dio = Dio();

  ApiManager(){
    dio.options.baseUrl = "https://api.spacexdata.com/v4";
  }

  List<Launch>? parseLaunches(List<dynamic>? json){
    if(json == null){
      return null;
    }
    List<dynamic> jsonArray = json;
    return jsonArray.map((json) => Launch.fromJson(json)).toList();
  }

  Future<List<Launch>?> getUpcomingLaunches() async{
    try{
      launches = await dio
          .get("/launches/upcoming").then((response) => parseLaunches(response.data));
      return launches;
    }catch (e){
      print("error : $e");
    }
  }

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
}