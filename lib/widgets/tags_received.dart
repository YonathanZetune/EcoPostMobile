import 'package:EcoPost/utilities/constants.dart';
import 'package:EcoPost/widgets/post_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TagReceivedCard extends StatefulWidget {
  @override
  _TagReceivedCardState createState() => _TagReceivedCardState();
}

class _TagReceivedCardState extends State<TagReceivedCard> {
  bool accepted = false;
  bool _showTimer = true;

  void onAccepted() {
    setState(() {
      accepted = true;
    });
  }

  void completed() {
    setState(() {
      _showTimer = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 20.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: Offset(
              7.0, // horizontal, move right 10
              7.0, // vertical, move down 10
            ),
          )
        ],
        borderRadius: new BorderRadius.all(Radius.circular(10)),
//        gradient: new LinearGradient(...),
      ),
      child: SlimyCard(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.95,
//      topCardHeight: 200,
//      bottomCardHeight: 400,
        borderRadius: 25,
        topCardWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FaIcon(
                  FontAwesomeIcons.solidBell,
                  color: Colors.blue,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: AutoSizeText(
                    "Joe terra-tagged you!",
                    style: GoogleFonts.monda(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Chip(
              backgroundColor: Colors.deepPurple,
              padding: EdgeInsets.all(5),
              label: Text(
                "#trashtag",
                style: GoogleFonts.monda(fontSize: 15, color: Colors.white),
              ),
//              color: Colors.blue,
////              shape: ShapeBorder.,
//              onPressed: () {},
//
//              child: AutoSizeText(
//                "#trashtag",
//                style: GoogleFonts.monda(fontSize: 20, color: Colors.white),
//              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProfileAvatar(
                  '',
                  child: Image(fit: BoxFit.fitHeight, width: 474, height: 375,image: AssetImage('assets/neil1.jpg')),
                  radius: 50,
                  borderColor: Constants.themeGreen,
                  borderWidth: 4,
                ),
              ),
            ),
            accepted == false
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.green,
                          onPressed: onAccepted,
                          child: AutoSizeText(
                            "Accept",
                            style: GoogleFonts.monda(
                                fontSize: 20, color: Colors.white),
                          )),
                      FlatButton(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.red,
                        onPressed: () {},
                        child: AutoSizeText(
                          "Decline",
                          style: GoogleFonts.monda(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ],
                  )
                : _showTimer
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FaIcon(FontAwesomeIcons.hourglass),
                          Row(
                            children: [
                              CountDown(
                                seconds: 58,
                                onTimer: () {
                                  setState(() {
                                    _showTimer = false;
                                  });
                                },
                                style: GoogleFonts.monda(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "s",
                                style: GoogleFonts.monda(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          FlatButton(
                            padding: const EdgeInsets.all(8.0),
                            color: Constants.themeGreen,
                            onPressed: completed,
                            child: AutoSizeText(
                              "Completed",
                              style: GoogleFonts.monda(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              "Time is up!",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.monda(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
          ],
        ),
        bottomCardWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.leaf),
                Text(
                  ' 25',
                  style: GoogleFonts.monda(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            accepted == false
                ? Container(
                    child: Text(
                      "Accept and complete within 24 hours to receive 25 terra points!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.monda(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : _showTimer == true
                    ? Center(
                        child: RichText(
                          text: TextSpan(
                              style: GoogleFonts.monda(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(text: "You\'re "),
                                TextSpan(
                                    text: "IT",
                                    style:
                                        TextStyle(color: Constants.themeGreen)),
                                TextSpan(text: "! Show us what you can do!"),
                              ]),
                        ),
                      )
                    : Container(
                        child: Text(
                          "If you completed the challenge on time, your points will be awarded soon.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.monda(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
          ],
        ),
        slimeEnabled: true,
      ),
    );
  }
}

class TagsReceived extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                new TagReceivedCard(),
                Divider(
                  thickness: 3,
                  indent: 12,
                  endIndent: 12,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
