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

class NewPostPage extends StatefulWidget {
  @override
  _NewPostPageState createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  File _image;
  String description;
  String handles;

  Future getImage(BuildContext context, bool fromCamera) async {
    print("PICKING");
    File image;
    if (fromCamera)
      await ImagePicker.pickImage(source: ImageSource.camera)
          .then((value) async {
        setState(() {
          _image = value;
        });
//        var info = Provider.of<EcoPostInfo>(context);
//        info.selectedImg = value;
//        await Requests.uploadNewPost(value, description, "NotWiredUP");
//        showPictureSuccessDialog(context);
      });
    else {
      await ImagePicker.pickImage(source: ImageSource.gallery)
          .then((value) async {
        setState(() {
          _image = value;
        });
//        var info = Provider.of<EcoPostInfo>(context);
//        info.selectedImg = value;
//        setImageOnScreen(value, context);
//        await Requests.uploadNewPost(value, description, "NotWiredUp");
//        showPictureSuccessDialog(context);
      });
//      return img;

    }
    //    var formInfo = Provider.of<FormInfo>(context, listen: false);
//    showAlertDialog(context, image);

//    return image;
  }

  Future<File> showPictureSuccessDialog(BuildContext context) async {
    // set up the buttons

    Widget continueButton = FlatButton(
      child: Text("Done"),
      onPressed: () async {
        Navigator.of(context).pop();

//        return await getImage(context, true);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Image Selected"),
      content: Text(
          "Image is ready to be uploaded. Fill out the description below, add challengers and hit post!"),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    return File(null);
  }

  Future<File> showPictureSourceDialog(BuildContext context) async {
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
        Navigator.of(context).pop();

        return await getImage(context, true);
      },
    );
    Widget galleryButton = FlatButton(
      child: Text("From Photos"),
      onPressed: () async {
        Navigator.of(context).pop();

        return await getImage(context, false);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("How would you like to take a picture"),
      content:
          Text("Image is ready to be uploaded. How would you like to proceed?"),
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
    return File(null);
  }

  @override
  Widget build(BuildContext context) {
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
                    File img = await showPictureSourceDialog(context);
                    showPictureSourceDialog(context);

//                    setImageOnScreen(img);

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
            _image == null
                ? Text('No image selected.')
                : SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                height: 150,

                child: Image.file(_image)),
//            Text("Select an image."),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  focusNode: FocusNode(skipTraversal: true),
                  controller: txtCon,
                  decoration: InputDecoration(
                    labelText: "Enter a description!",
                  ),
                  keyboardType: TextInputType.text,
                  autofocus: false,
                  autofillHints: ["dsfsd"],
                  onChanged: (val) {},
                  onSubmitted: (des) async {
                    print("SUB: " + des);
                    setState(() {
                      description = des;
                    });
                    await Requests.uploadNewPost(_image, description, "NotWiredUP");

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
