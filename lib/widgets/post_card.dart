import 'package:EcoPost/models/ecopost_info.dart';
import 'package:EcoPost/utilities/constants.dart';
import 'package:EcoPost/utilities/requests.dart';
import 'package:EcoPost/widgets/back_card_post.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flip/flip.dart';
import 'package:flip_card/flip_card.dart';
import 'package:floating_ribbon/floating_ribbon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_text/skeleton_text.dart';

//
//class FrontCard extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Text('');
//  }
//}

class PostCard extends StatelessWidget {
//  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  FlipController controller = new FlipController();

  @override
  Widget build(BuildContext context) {
    var postInfo = Provider.of<EcoPostInfo>(context);
    bool isFront = postInfo.showMap;
    Key mKey = Key(DateTime.now().toString());
    return GestureDetector(
      onTap: () {
        controller.flip();
//        controller.notifyListeners();
        print("FLIPPED");
      },
      child: Flip(
        controller: controller,
//      onFlip: () async {
//        postInfo.showMap = !postInfo.showMap;
//        if (isFront) {
//          postInfo.showMap = false;
//          print("ON FRONT");
//        } else {
//          postInfo.showMap = true;
//          print("ON BACK");
//        }
//
//        print("flipped");
////        await Requests.uploadImage();
//      },
//      flipOnTouch: false,
        flipDirection: Axis.horizontal,
        flipDuration: Duration(milliseconds: 200),
        // default
        firstChild: Container(
//        height: 300,
//        width: MediaQuery.of(context).size.width,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText("#feeling-clean", textAlign: TextAlign.start, style: GoogleFonts.abel(fontStyle: FontStyle.italic, color: Colors.blue, fontSize: 20),),
                    Row(
                      children: [
                        FloatingRibbon(
                          height: 120,
                          width: 75,
                          childHeight: 70,
                          childWidth: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProfileAvatar(
                              '',
                              child: Image(
                                  image: AssetImage('assets/avatar1.JPG')),
//                              radius: 20,
                              borderColor: Constants.themeGreen,
                              borderWidth: 4,
                            ),
                          ),
//                  childDecoration: BoxDecoration(color: Colors.grey),
                          ribbon: SkeletonAnimation(
                            child: Center(
                              child: AutoSizeText(
                                'popular',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          shadowHeight: 5,
                        ),
                        VerticalDivider(
                          indent: 10,
                          endIndent: 10,
                          thickness: 2,
                          color: Colors.grey,
                        ),
                        AutoSizeText("Yonathan Zetune")
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          "assets/trashtag1.jpg",
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Badge(
                                  position: BadgePosition.bottomRight(),
                                  badgeColor: Constants.themeLightGreen,
                                  badgeContent: AutoSizeText("32", style: TextStyle(fontSize: 16,color: Colors.white),),
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    elevation: 10,
                                    heroTag: FontAwesomeIcons.random.toString() +
                                        DateTime.now().toString(),
                                    mini: true,
                                    onPressed: () {},
                                    child: FaIcon(
                                      FontAwesomeIcons.leaf,
                                      size: 16,
                                      color: Constants.themeLightGreen,
                                    ),
                                  ),
                                ),
                              ),
//                              Positioned(
//                                bottom: 0,
//                                  right: ,
//                                  child: AutoSizeText("32", style: GoogleFonts.balooTamma(color: Constants.themeLightGreen),)),
                            ]),
                            FloatingActionButton(
                              backgroundColor: Colors.white,
                              elevation: 10,
                              heroTag: FontAwesomeIcons.random.toString() +
                                  DateTime.now().toString(),
                              mini: true,
                              onPressed: () {},
                              child: FaIcon(
                                FontAwesomeIcons.comment,
                                size: 18,
                                color: Constants.themeLightGreen,
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.white,
                              elevation: 10,
                              heroTag: FontAwesomeIcons.random.toString() +
                                  DateTime.now().toString(),
                              mini: true,
                              onPressed: () {},
                              child: FaIcon(
                                FontAwesomeIcons.trophy,
                                size: 18,
                                color: Constants.themeLightGreen,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AutoSizeText(
                              "4 hours ago",
                              style: GoogleFonts.zillaSlab(),
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        "Awesome time cleaning Spring Creek!",
                        style: GoogleFonts.rokkitt(fontSize: 20),
                        wrapWords: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        secondChild:
            BackCard(lat: 33.071153, long: -96.704665), // : FrontCard(),
      ),
    );
  }
}
