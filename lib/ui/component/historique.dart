import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/manager/api_manager.dart';
import '../../core/manager/launch_manager.dart';
import '../../core/manager/locator.dart';
import '../../core/model/launch.dart';

class Historique extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
            future: locator<ApiManager>().getPastsLaunches(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var launches = snapshot.data as List<Launch>;
                var launchesReversed = launches.reversed.toList();
                return ListView.builder(
                    itemCount: launches.length,
                    itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(launchesReversed[i].name ?? ""),
                          subtitle: Text(LaunchManager()
                              .convertDate(launchesReversed[i].dateUtc ?? "")
                          ),
                        );
                      }
                    );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
    );
  }
}