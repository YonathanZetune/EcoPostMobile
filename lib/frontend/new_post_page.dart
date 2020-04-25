import 'dart:async';
import 'dart:io';

import 'package:EcoPost/models/ecopost_info.dart';
import 'package:EcoPost/utilities/constants.dart';
import 'package:EcoPost/utilities/requests.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewPostPage extends StatelessWidget {
  Future<void> getImage(BuildContext context, bool fromCamera) async {
    print("PICKING");
    File image;
    if (fromCamera)
      await ImagePicker.pickImage(source: ImageSource.camera)
          .then((value) async {
//        var info = Provider.of<EcoPostInfo>(context);
//        info.selectedImg = value;
        await Requests.uploadImage(value);
      });
    else
      await ImagePicker.pickImage(source: ImageSource.gallery)
          .then((value) async {
//        var info = Provider.of<EcoPostInfo>(context);
//        info.selectedImg = value;
        await Requests.uploadImage(value);
      });
    //    var formInfo = Provider.of<FormInfo>(context, listen: false);
//    showAlertDialog(context, image);

//    return image;
  }

  showPictureSourceDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("From Camera"),
      onPressed: () async {
        getImage(context, true);
        Navigator.of(context).pop();
      },
    );
    Widget galleryButton = FlatButton(
      child: Text("From Photos"),
      onPressed: () async {
        getImage(context, false);
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("How would you like to take a picture"),
      content:
          Text("Image is ready to be uploaded. Would you like to proceed?"),
      actions: [
        cancelButton,
        continueButton,
        galleryButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
//    AlertDialog alertSuccess = AlertDialog(
//      title: Text("Form was received and updated databse!"),
//      content:
//      Text("You report is not available on the List tab"),
//      actions: [
//        cancelButton,
//
//      ],
//    );
//
//    // show the dialog
//    showDialogSuc(
//      context: context,
//      builder: (BuildContext context) {
//        return alertSuccess;
//      },
//    );
  }

  @override
  Widget build(BuildContext context) {
//    void _doSomething() async {
//      Timer(Duration(seconds: 3), () {
//        print("LOADD");
//        _btnController.success();
//      });
//    }

    TextEditingController txtCon = new TextEditingController();
    var postInfo = Provider.of<EcoPostInfo>(context);
    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                color: Constants.themeLightGreen,
                elevation: 24,
                child: FlatButton(
                  onPressed: () async {
                    showPictureSourceDialog(context);

                    //Go to Leaderboard page
//                  Navigator.of(context).pushNamed('/LeaderBoardPage');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: FaIcon(
                          FontAwesomeIcons.upload,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),

                      AutoSizeText(
                        "Select Image",
                        style: GoogleFonts.balooBhai(
                            fontSize: 25, color: Colors.white),
                      ),
//                    FaIcon(
//                      FontAwesomeIcons.arrowAltCircleRight,
//                      color: Colors.white,
//                      size: 25,
//                    )
                    ],
                  ),
//                    color: Constants.themeLightGreen,
                  splashColor: Constants.themeGreen,
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  focusNode: FocusNode(skipTraversal: true),
                  controller: txtCon,
                  decoration: InputDecoration(
                    labelText: "Enter a descirption!",
                  ),
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  autofillHints: ["dsfsd"],
                  onChanged: (val) {},
                  onSubmitted: (des) {
                    print("SUB: " + des);
                    postInfo.description = des;
                    FocusScope.of(context).unfocus();
                  },
//                onEditingComplete: (){
//                  print("DONE");
////                  txtCon.
////                  txtCon.dispose();
//                  FocusScope.of(context).unfocus();
//
//
//                },
                ),
              ),
            ),
            postInfo.description == ""
                ? Text('')
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      postInfo.description,
                      style: GoogleFonts.balooPaaji(
                        fontSize: 16,
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                color: Constants.themeLightGreen,
                elevation: 24,
                child: FlatButton(
                  onPressed: () async {
//                    showPictureSourceDialog(context);
                    print(postInfo.selectedImg.toString());
//                    await Requests.uploadImage(postInfo.selectedImg);

                    //Go to Leaderboard page
//                  Navigator.of(context).pushNamed('/LeaderBoardPage');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),

                      AutoSizeText(
                        "Upload Post",
                        style: GoogleFonts.balooBhai(
                            fontSize: 25, color: Colors.white),
                      ),
//                    FaIcon(
//                      FontAwesomeIcons.arrowAltCircleRight,
//                      color: Colors.white,
//                      size: 25,
//                    )

                    ],
                  ),
//                    color: Constants.themeLightGreen,
                  splashColor: Constants.themeGreen,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
