import 'package:EcoPost/models/ecopost_info.dart';
import 'package:EcoPost/utilities/constants.dart';
import 'package:EcoPost/utilities/requests.dart';
import 'package:EcoPost/widgets/back_card_post.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flip/flip.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
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
                  children: [
                    Row(
                      children: [
                        CircularProfileAvatar(
                          '',
                          child: Image(image: AssetImage('assets/avatar1.JPG')),
                          radius: 25,
                          borderColor: Constants.themeGreen,
                          borderWidth: 4,
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
                    AutoSizeText(
                      "Awesome time cleaning Spring Creek!",
                      wrapWords: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          heroTag: FontAwesomeIcons.random.toString() +
                              DateTime.now().toString(),
                          mini: true,
                          onPressed: () {},
                          child: Icon(
                            Icons.thumb_up,
                            size: 18,
                          ),
                        ),
                        AutoSizeText("32")
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        secondChild: BackCard(lat: 33.071153, long: -96.704665), // : FrontCard(),
      ),
    );
  }
}
