import 'package:EcoPost/utilities/constants.dart';
import 'package:EcoPost/widgets/post_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slimy_card/slimy_card.dart';

class TagReceivedCard extends StatelessWidget {
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
                FaIcon(FontAwesomeIcons.solidBell, color: Colors.blue,),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: AutoSizeText(
                    "Joe challenged you to tag:",
                    style:
                        GoogleFonts.monda(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Chip(
              backgroundColor: Colors.deepPurple,
              padding: EdgeInsets.all(5),
              label: Text("#trashtag", style: GoogleFonts.monda(fontSize: 15, color: Colors.white),),
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
                  child: Image(image: AssetImage('assets/avatar2.jpg')),
                  radius: 50,
                  borderColor: Constants.themeGreen,
                  borderWidth: 4,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.green,
                    onPressed: () {},
                    child: AutoSizeText(
                      "Accept",
                      style: GoogleFonts.monda(fontSize: 20, color: Colors.white),
                    )),
                FlatButton(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.red,
                  onPressed: () {},
                  child: AutoSizeText(
                    "Deline",
                    style: GoogleFonts.monda(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            )
          ],
        ),
        bottomCardWidget: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: AutoSizeText(
                "Accept and complete within 24hrs to receive 25 terra points!",
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
