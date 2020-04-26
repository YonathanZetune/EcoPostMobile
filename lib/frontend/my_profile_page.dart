import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utilities/constants.dart';

const kLargeTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);
const kTitleTextStyle = TextStyle(
  fontSize: 16,
  color: Color.fromRGBO(129, 165, 168, 1),
);
const kNumbersTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
const kNumbersDescTextStyle =
TextStyle(fontSize: 16, color: Color.fromRGBO(0, 0, 0, .5));
double kSpacing = 10;

class MyProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AutoSizeText("@dylantheriot", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),),
        backgroundColor: Constants.themeGreen,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 15),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/pfp.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kSpacing,
                ),
                Text(
                  'Dylan Theriot',
                  style: kLargeTextStyle,
                ),
                SizedBox(
                  height: kSpacing,
                ),
                Text(
                  'Huge fan of turtles!',
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: kSpacing,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialButton(
                      icon: FontAwesomeIcons.facebook,
                      iconColor: Color.fromRGBO(59, 82, 152, 1),
                      containerColor: Color.fromRGBO(59, 82, 152, .2),
                    ),
                    SocialButton(
                      icon: FontAwesomeIcons.instagram,
                      iconColor: Color.fromRGBO(188, 42, 141, 1),
                      containerColor: Color.fromRGBO(188, 42, 141, .2),
                    ),
                    SocialButton(
                      icon: FontAwesomeIcons.snapchat,
                      iconColor: Color.fromRGBO(255, 252, 0, 1),
                      containerColor: Colors.grey,
                    ),
                    SocialButton(
                      icon: FontAwesomeIcons.linkedinIn,
                      iconColor: Color.fromRGBO(40, 103, 178, 1),
                      containerColor: Color.fromRGBO(40, 103, 178, .2),
                    ),
                  ],
                ),
                SizedBox(
                  height: kSpacing,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PostFollower(
                      number: 324,
                      title: 'Points',
                    ),
                    Container(
                        height: 20,
                        child: VerticalDivider(
                          color: Colors.black,
                        )),
                    PostFollower(
                      number: 32,
                      title: 'Followers',
                    ),
                    Container(
                        height: 20,
                        child: VerticalDivider(
                          color: Colors.black,
                        )),
                    PostFollower(
                      number: 47,
                      title: 'Following',
                    ),
                  ],
                ),
                SizedBox(
                  height: kSpacing,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            color: Constants.themeGreen,
                            border: Border.all(
                              width: 2,
                              color: Constants.themeGreen,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: kSpacing,
                    ),
                    Expanded(
                      child: RawMaterialButton(
                        onPressed: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Constants.themeGreen,
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Center(
                            child: Text(
                              'Settings',
                              style: TextStyle(
                                color: Constants.themeGreen,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: kSpacing,
                ),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: images.map((path) => new GalleryImage(imagePath: path.toString())).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var images = ['assets/1.jpg', 'assets/2.jpg', 'assets/3.JPG', 'assets/4.JPG', 'assets/5.jpg', 'assets/6.JPG', 'assets/7.jpg'];

class GalleryImage extends StatelessWidget {
  final String imagePath;

  GalleryImage({@required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: new AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PostFollower extends StatelessWidget {
  final int number;
  final String title;

  PostFollower({@required this.number, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            number.toString(),
            style: kNumbersTextStyle,
          ),
          Text(
            title,
            style: kNumbersDescTextStyle,
          ),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color containerColor;

  SocialButton(
      {@required this.icon,
        @required this.iconColor,
        @required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 7,
      ),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: containerColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 20,
      ),
    );
  }
}