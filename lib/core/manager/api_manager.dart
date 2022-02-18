

import 'package:dio/dio.dart';
import 'package:flutter_space_x/core/model/launch.dart';

class ApiManager{
  List<Launch>? launches;

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

}