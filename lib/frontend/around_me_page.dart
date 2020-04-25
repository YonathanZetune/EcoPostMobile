import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/constants.dart';

class AroundMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
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
                          text: ["View Leaderboard", "Compete With Friends!", "Updated Daily!"],
                          textStyle: GoogleFonts.balooBhai(
                              fontSize: 18, color: Colors.white), //TextStyle(fontSize: 18.0, fontFamily: "Horizon", color: Colors.white),
                          textAlign: TextAlign.start,
                          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
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
            )
          ],
        ),
      ),
    );
  }
}