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
                    itemCount: launches.length,
                    itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(launchesReversed[i].name ?? ""),
                          subtitle: Text(LaunchManager()
                              .convertDate(launchesReversed[i].dateUtc ?? "")
                          ),
                          onTap: () {
                            Provider.of<HomeViewModel>(context, listen: false)
                                .launch = launches[i];
                            showDetailPage(context);
                          },
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