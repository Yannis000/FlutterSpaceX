import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_x/core/manager/locator.dart';
import 'package:provider/provider.dart';

import '../../core/manager/api_manager.dart';
import '../../core/manager/launch_manager.dart';
import '../../core/model/launch.dart';
import '../../core/viewModel/HomeViewModel.dart';
import '../detailLaunch.dart';
import 'timer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
          future: locator<ApiManager>().getUpcomingLaunches(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var launches = snapshot.data as List<Launch>;
              return ListView.builder(
                  itemCount: launches.length,
                  itemBuilder: (context, i) {
                    if (i == 0) {
                      return GestureDetector(
                        onTap: () {
                          Provider.of<HomeViewModel>(context, listen: false)
                              .launch = launches[i];
                          showDetailPage(context);
                        },
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 36),
                                  child: Column(
                                    children: [
                                      const Text("Mission start :"),
                                      Timer(launches[i].dateLocal ?? ""),
                                    ],
                                  )),
                              Row(children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  child: Hero(
                                      tag: "badge",
                                      child: Image.network(
                                          launches[i].links?.patch?.small ??
                                              "")),
                                ),
                                Text(
                                  launches[i].name ?? "",
                                  style: const TextStyle(fontSize: 22),
                                )
                              ])
                            ],
                          ),
                        )),
                      );
                    } else {
                      return ListTile(
                        title: Text(launches[i].name ?? ""),
                        subtitle: Text(LaunchManager()
                                .convertDate(launches[i].dateUtc ?? "")
                            // launches[i].dateUtc ?? ""
                            ),
                        onTap: () {
                          Provider.of<HomeViewModel>(context, listen: false)
                              .launch = launches[i];
                          showDetailPage(context);
                        },
                      );
                    }
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  showDetailPage(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return detailLaunch();
        },
      ),
    );
  }
}
