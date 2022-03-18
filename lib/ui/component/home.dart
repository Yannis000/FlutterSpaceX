import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_x/core/manager/database_manager.dart';
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
                /*return FutureBuilder(
                    future: locator<DatabaseManager>().getAllLaunch(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var favorites = snapshot.data as List<Launch>?;
                        print(favorites?.first.name ?? "no launch");*/
                return ListView.builder(
                    itemCount: launches.length,
                    itemBuilder: (context, i) {
                      if (i == 0) {
                        return GestureDetector(
                          onTap: () {
                            Provider
                                .of<HomeViewModel>(context,
                                listen: false)
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
                                            Timer(launches[i].dateLocal ??
                                                ""),
                                          ],
                                        )),
                                    Row(children: [
                                      Hero(
                                          tag: launches[i].name ?? "",
                                          child: Image.network(
                                              launches[i]
                                                  .links
                                                  ?.patch
                                                  ?.large ??
                                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/SpaceX_Crew-1_logo.svg/1200px-SpaceX_Crew-1_logo.svg.png",
                                              width: 130,
                                              height: 130)),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              launches[i].name ?? "",
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                            Text(
                                                LaunchManager().convertDate(
                                                    launches[i].dateUtc ??
                                                        ""),
                                                style: const TextStyle(
                                                    fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          // var isFav = favorites?.contains(launches[i]) ?? false;
                                          // locator<DatabaseManager>().toggleFavorite(isFav, launches[i]);
                                        },
                                        icon: Icon(Icons.star),
                                        iconSize: 30,
                                      )
                                    ])
                                  ],
                                ),
                              )),
                        );
                      } else {
                        return GestureDetector(
                            onTap: () {
                              Provider
                                  .of<HomeViewModel>(context,
                                  listen: false)
                                  .launch = launches[i];
                              showDetailPage(context);
                            },
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: Row(
                                children: [
                                  Hero(
                                    tag: launches[i].name ?? "",
                                    child: Image.network(
                                      launches[i].links?.patch?.small ??
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/SpaceX_Crew-1_logo.svg/1200px-SpaceX_Crew-1_logo.svg.png",
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              launches[i].name ?? "",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight:
                                                  FontWeight.bold),
                                            ),
                                            Text(LaunchManager()
                                                .convertDate(launches[i]
                                                .dateUtc ??
                                                ""))
                                          ],
                                        )),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // var isFav = favorites?.contains(launches[i]) ?? false;
                                      // locator<DatabaseManager>().toggleFavorite(isFav, launches[i]);
                                    },
                                    icon: Icon(Icons.star),
                                    iconSize: 30,
                                  )
                                ],
                              ),
                            ));
                      }
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
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
