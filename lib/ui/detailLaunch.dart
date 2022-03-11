import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_space_x/core/viewModel/HomeViewModel.dart';
import 'package:provider/provider.dart';

import 'component/timer.dart';

class detailLaunch extends StatelessWidget {
  const detailLaunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            Provider.of<HomeViewModel>(context, listen: false).launch?.name ??
                ""),
      ),
      body: Column(children: [
        Hero(
            tag: "badge",
            child: Image.network(Provider.of<HomeViewModel>(context,
                        listen: false)
                    .launch
                    ?.links
                    ?.patch
                    ?.large ??
                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/SpaceX_Crew-1_logo.svg/1200px-SpaceX_Crew-1_logo.svg.png")),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text("Mission start :"),
            ),
            Timer(Provider.of<HomeViewModel>(context, listen: false)
                    .launch
                    ?.dateLocal ??
                "")
          ],
        ),
        Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    Provider.of<HomeViewModel>(context, listen: false)
                            .launch
                            ?.details ??
                        "",
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            )),
      ]),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
