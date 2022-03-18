import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_space_x/core/manager/api_manager.dart';
import 'package:flutter_space_x/core/model/launchpad.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/manager/locator.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> _controller = Completer();

    const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
    );

    List<Marker> customMarkers = [];

    return Scaffold(
      body: FutureBuilder(
        future: locator<ApiManager>().getAllLaunchpad(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var launchpads = snapshot.data as List<Launchpad>;
            launchpads.forEach((element) {
              customMarkers.add(Marker(
                markerId: MarkerId(element.name ?? ""),
                position: LatLng(element.latitude ?? 0.0, element.longitude ?? 0.0),
                infoWindow: InfoWindow(title: element.name)
              ));
            });
            return GoogleMap(
              mapType: MapType.normal,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: _kGooglePlex,
              markers: customMarkers.toSet(),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },

      )


    );
  }
}