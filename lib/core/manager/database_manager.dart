import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

import '../model/launch.dart';

@singleton
class DatabaseManager {
  late Database _db;

  var launchStore = intMapStoreFactory.store("launches");

  Future addLaunch(Launch launch) async {
    await launchStore.add(_db, launch.toJson());
  }

  Future deleteLaunch(Launch launch) async {
    await launchStore.delete(_db,
        finder: Finder(filter: Filter.byKey(launch.flightNumber)));
  }

  toggleFavorite(bool isFav, Launch launch){
    if(isFav){
      print("delete launch");
      deleteLaunch(launch);
    }else{
      print("add launch");
      addLaunch(launch);
    }
  }

  Future<List<Launch>> getAllLaunch() async {
    final recordSnapshot = await launchStore.find(_db);
    return recordSnapshot.map((snapshot) {
      final launches = Launch.fromJson(snapshot.value);
      print(launches.name);
      print("test");
      return launches;
    }).toList();
  }

  Future main() async {
    String dataDirectoryPath = (await getApplicationDocumentsDirectory()).path;
    String dbPath = "$dataDirectoryPath/spacex.db";
    _db = await databaseFactoryIo.openDatabase(dbPath);
  }
}
