import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utilities/constants.dart';

class AroundMe extends StatelessWidget {
  static final Completer<GoogleMapController> mController = Completer();

  static Set<Marker> mrks = new Set<Marker>();

  @override
  Widget build(BuildContext context) {
    List<LatLng> locs = new List<LatLng>();
    locs.add(LatLng(33.072774, -96.705764));
    locs.add(LatLng(33.069834, -96.701022));
    locs.add(LatLng(33.067406, -96.702417));
    locs.add(LatLng(33.075237, -96.699670));

    locs.add(LatLng(33.076824, -96.705925));
    locs.add(LatLng(33.068130, -96.706505));


    locs.forEach((element) {
      Marker marker = new Marker(
        markerId: MarkerId(element.latitude.toString()),
        position: element,
      );
      mrks.add(marker);
    });
    return Container(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                color: Constants.themeLightGreen,
                elevation: 24,
                child: FlatButton(
                  onPressed: () {
                    //Go to Leaderboard page
                    Navigator.of(context).pushNamed('/LeaderBoardPage');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(
                          FontAwesomeIcons.clipboardList,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      RotateAnimatedTextKit(
                          onTap: () {
                            print("Tap Event");
                          },
                          text: [
                            "View Leaderboard",
                            "Compete With Friends!",
                            "Updated Daily!"
                          ],
                          textStyle: GoogleFonts.balooBhai(
                              fontSize: 18, color: Colors.white),
                          //TextStyle(fontSize: 18.0, fontFamily: "Horizon", color: Colors.white),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional
                              .topStart // or Alignment.topLeft
                      ),
                      FaIcon(
                        FontAwesomeIcons.arrowAltCircleRight,
                        color: Colors.white,
                        size: 25,
                      )
                    ],
                  ),
//                    color: Constants.themeLightGreen,
                  splashColor: Colors.purple,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.9,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: GoogleMap(
                  mapType: MapType.normal,
                  myLocationButtonEnabled: false,
                  zoomGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  myLocationEnabled: false,
                  compassEnabled: false,
                  mapToolbarEnabled: true,
//33.071153, -96.704665
                  initialCameraPosition: CameraPosition(
                      target: LatLng(33.071153, -96.704665), zoom: 15.0),
                  markers: mrks,
//        markers: mapInfo.fireMarkers,
                  // TODO: addmarkers
                  onMapCreated: (GoogleMapController controller) async {
//          SharedPreferences prefs = await SharedPreferences.getInstance();
//          controller.setMapStyle(mapInfo.mapStyle);
                    mController.complete(controller);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
