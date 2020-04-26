import 'dart:math';

import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:EcoPost/utilities/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

import '../utilities/constants.dart';

const kLeaderboardHeaderFontStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 50,
);

const kWinnersNumberFontStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
);

const kWinnersNameFontStyle = TextStyle(
  fontSize: 20,
);

class LeaderboardPage extends StatelessWidget {
//  @override
//  _LeaderboardPageState createState() => _LeaderboardPageState();
//}

//class _LeaderboardPageState extends State<LeaderboardPage> {
  List<bool> _isSelected = List.generate(3, (_) => false);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Leaderboard",
            style: GoogleFonts.rokkitt(fontSize: 35, letterSpacing: 3)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(),
              WinnersText(text: "1st Place", name: "Anna B."),
              Padding(
                padding: EdgeInsets.fromLTRB(0, screenHeight / 45, 0, 0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  overflow: Overflow.visible,
                  //alignment:new Alignment(x, y)
                  children: <Widget>[
                    Container(
                      height: 140 + screenHeight / 10.2,
                    ),
                    Positioned(
                      top: screenHeight / 10,
                      left: screenWidth / 1.8,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color: Constants.themeGreen,
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/pfp.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenHeight / 10,
                      right: screenWidth / 1.8,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color: Constants.themeGreen,
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/neil.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 5,
                            color: Constants.themeGreen,
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/anna.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: screenWidth / 3.6,
                        top: -1 * screenHeight / 40,
                        child: Container(
                            height: 100,
                            width: 100,
                            child:
                                Image(image: AssetImage('assets/crown.png'))))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    WinnersText(text: "2nd Place", name: "Neil D."),
                    WinnersText(text: "3rd Place", name: "Dylan T."),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: MaterialSegmentedControl(
                  children: {
                    0: Text(
                      "    DAY   ",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    1: Text(
                      "   WEEK   ",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                    2: Text(
                      "   MONTH   ",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  },
                  horizontalPadding: EdgeInsets.all(3),
                  selectionIndex: 0,
                  borderColor: Colors.grey,
                  selectedColor: Constants.themeLightGreen,
                  unselectedColor: Colors.white,
                  borderRadius: 12.0,
                  onSegmentChosen: (index) {
//                    setState(() {
//                      _currentSelection = index;
//                    });
                  },
                ),
              ),
              LeaderboardColumnTitle(),
              new ListView.builder(
//              physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        LeaderboardRow(
                          index: index,
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class LeaderboardRow extends StatelessWidget {
  final int index;

  LeaderboardRow({this.index});

  String getImage(int i) {
    switch (i) {
      case 0:
        return 'assets/anna.png';
        break;
      case 1:
        return 'assets/neil.jpg';
      case 2:
        return 'assets/pfp.png';
        break;
      case 3:
        return 'assets/avatar1.JPG';
      case 4:
        return 'assets/anooj.png';
        break;
      case 5:
        return 'assets/mel.jpg';
        break;
      default:
        return 'assets/neil.jpg';
    }
  }

  String getName(int i) {
    switch (i) {
      case 0:
        return 'Anna';
        break;
      case 1:
        return 'Neil';
      case 2:
        return 'Dylan';
        break;
      case 3:
        return 'Yonathan';
      case 4:
        return 'Anooj';
        break;
      case 5:
        return 'assets/mel.jpg';
        break;
      default:
        return 'assets/neil.jpg';
    }
  }
  String getPoints(int i) {
    switch (i) {
      case 0:
        return '486';
        break;
      case 1:
        return '345';
      case 2:
        return '324';
        break;
      case 3:
        return '311';
      case 4:
        return '234';
        break;
      case 5:
        return 'assets/mel.jpg';
        break;
      default:
        return 'assets/neil.jpg';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(2, 0, 0, 4),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularProfileAvatar(
              '',
              child:
                  Image(fit: BoxFit.cover, image: AssetImage(getImage(index))),
              radius: 25,
              borderColor: Constants.themeGreen,
              borderWidth: 4,
            ),
            AutoSizeText(getName(index)),
            Container(),
            Container(),
            Container(),
            Text(getPoints(index)),
          ],
        ),
      ),
    );
  }
}

class LeaderboardColumnTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: false,
              child: CircularProfileAvatar(
                '',
                child: Image(image: AssetImage('assets/avatar1.JPG')),
                radius: 25,
                borderColor: Constants.themeGreen,
                borderWidth: 4,
              ),
            ),
            Visibility(visible: false, child: AutoSizeText("Yonathan Zetune")),
            Container(),
            Container(),
            Container(),
            Text("Points", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class WinnersText extends StatelessWidget {
  final String text;
  final String name;

  WinnersText({@required this.text, @required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: kWinnersNumberFontStyle),
        Text(name, style: kWinnersNameFontStyle),
      ],
    );
  }
}
