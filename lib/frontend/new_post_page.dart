import 'dart:io';

import 'package:EcoPost/utilities/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class NewPostPage extends StatelessWidget {

  Future<File> getImage(BuildContext context) async {
    print("PICKING");
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //    var formInfo = Provider.of<FormInfo>(context, listen: false);
//    showAlertDialog(context, image);
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Card(
              color: Constants.themeLightGreen,
              elevation: 24,
              child: FlatButton(
                onPressed: () async {
                  await getImage(context);

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
                      "Upload Image",
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
          )
        ],),
      ),
    );
//    return Container(
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text("Report Animal / Help"),
//        ),
//        body: Padding(
//          padding: const EdgeInsets.all(14.0),
//          child: Column(
//            children: <Widget>[
//              FormBuilder(
//                key: _fbKey,
//                initialValue: {
//                  'date': DateTime.now(),
//                  'accept_terms': false,
//                },
//                autovalidate: true,
//                child: Column(
//                  children: <Widget>[
//                    FormBuilderSegmentedControl(
//                      decoration: InputDecoration(labelText: "Report Type"),
//                      attribute: "reporting_type",
//                      options: List.generate(2, (i) => i + 1)
//                          .map((number) => FormBuilderFieldOption(
//                          value: number == 1 ? "Animal" : "Help"))
//                          .toList(),
//                    ),
//                    FormBuilderTextField(
//                      attribute: "Description",
//                      decoration: InputDecoration(labelText: "Summary"),
//                      validators: [
//                        FormBuilderValidators.max(100),
//                      ],
//                    ),
//                    FormBuilderSegmentedControl(
//                      decoration: InputDecoration(labelText: "Route to organization"),
//                      attribute: "org_type",
//                      options: [FormBuilderFieldOption(
//                          value: "Food"),FormBuilderFieldOption(
//                          value: "Shelter"),FormBuilderFieldOption(
//                          value: "Transport")],
//                    ),
//                    FormBuilderSwitch(
//                      label: Text('Upload Image'),
//                      attribute: "accept_terms_switch",
//                      initialValue: false,
//                      onChanged: (selected) async {
//                        if (selected) {
//                          print('selected');
////                          formInfo.needUpload = true;
//
////                          formInfo.image = await getImage(context);
//                        } else {
//                          print('notselected');
////                          formInfo.image = null;
//                        }
//                      },
//                    ),
//                    Row(
//                      children: <Widget>[
//                        MaterialButton(
//                          child: Text("Submit"),
//                          onPressed: () async {
////                            print("SPEC");
////
////                            await Requests.getImageProperties(formInfo.image)
////                                .then((spec) async {
////                              print("SPEC");
////
////                              await Requests.postFAPIAnimal(Constants.startLat,
////                                  Constants.startLong, spec).then((status){
////                                if(status == 200){
////                                  print("Data received!");
////                                }
////                              });
//
//
////                            });
//                            if (_fbKey.currentState.saveAndValidate()) {
//                              print(_fbKey.currentState.value);
//                            }
//                            //call to post request
//
//                          },
//                        ),
////                        MaterialButton(
////                          child: Text("Reset"),
////                          onPressed: () {
////                            _fbKey.currentState.reset();
////                          },
////                        ),
//                      ],
//                    )
//                  ],
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
  }
}
