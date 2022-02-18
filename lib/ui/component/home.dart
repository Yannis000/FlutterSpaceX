import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/manager/api_manager.dart';
import '../../core/manager/launch_manager.dart';
import '../../core/manager/timer_manager.dart';
import '../../core/model/launch.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder(
            future: ApiManager().getUpcomingLaunches(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var launches = snapshot.data as List<Launch>;
                return ListView.builder(
                    itemCount: launches.length,
                    itemBuilder: (context, i) {
                      if (i == 0) {
                        return Center(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 36),
                                  child: Text(
                                    TimerManager().intToTimeLeft(TimerManager()
                                        .convertDateTime(
                                            launches[i].dateLocal ?? "")
                                        .difference(DateTime.now())
                                        .inSeconds),
                                    style: TextStyle(fontSize: 38),
                                  )),
                              Row(children: [
                                Container(
                                    height: 80,
                                    width: 80,
                                    child: Image.network(
                                        launches[i].links?.patch?.small ?? "")),
                                Text(
                                  launches[i].name ?? "",
                                  style: const TextStyle(fontSize: 22),
                                )
                              ])
                            ],
                          ),
                        ));
                      } else {
                        return ListTile(
                          title: Text(launches[i].name ?? ""),
                          subtitle: Text(LaunchManager()
                                  .convertDate(launches[i].dateUtc ?? "")
                              // launches[i].dateUtc ?? ""
                              ),
                        );
                      }
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })
    );
  }
}
