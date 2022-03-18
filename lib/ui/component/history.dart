import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/manager/api_manager.dart';
import '../../core/manager/launch_manager.dart';
import '../../core/manager/locator.dart';
import '../../core/model/launch.dart';
import '../../core/viewModel/HomeViewModel.dart';
import '../detailLaunch.dart';

class History extends StatelessWidget {
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
                    itemCount: launchesReversed.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          Provider.of<HomeViewModel>(context, listen: false)
                              .launch = launchesReversed[i];
                          showDetailPage(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Row(
                            children: [
                              Hero(
                                tag: launchesReversed[i].name ?? "",
                                child: Image.network(
                                  launchesReversed[i].links?.patch?.large ??
                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/SpaceX_Crew-1_logo.svg/1200px-SpaceX_Crew-1_logo.svg.png",
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child:
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        launchesReversed[i].name ?? "",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(LaunchManager().convertDate(
                                          launchesReversed[i].dateUtc ?? ""))
                                    ],
                                  ),
                                )
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
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
