import 'package:EcoPost/utilities/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OthersChallengePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "TERRA-TAGGED",
          style: GoogleFonts.teko(
              fontWeight: FontWeight.bold, letterSpacing: 6, fontSize: 30),
        ),
        backgroundColor: Constants.themeGreen,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(child: TitleChallengesRow()),
                      Divider(
                        color: Colors.grey,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 7,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                ChallengesRow(),
                              ],
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleChallengesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: ListTile(
        title: Row(
          children: [
            CircularProfileAvatar(
              '',
              child: Image(image: AssetImage('assets/avatar1.JPG')),
              radius: 25,
              borderColor: Constants.themeGreen,
              borderWidth: 4,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                      child: AutoSizeText("yonnieboy"),
                    ),
                    Container(),
                    RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            children: [
                          TextSpan(text: "Yonathan"),
                          TextSpan(text: " terra-tagged..."),
                        ])),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChallengesRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: ListTile(
        title: Row(
          children: [
            CircularProfileAvatar(
              '',
              child: Image(image: AssetImage('assets/avatar1.JPG')),
              radius: 25,
              borderColor: Constants.themeGreen,
              borderWidth: 4,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                      child: AutoSizeText("yonnieboy"),
                    ),
                    Container(),
                  ],
                ),
              ),
            ),
            Text('Status: '),
            Checkbox(value: false, onChanged: null),
          ],
        ),
      ),
    );
  }
}
