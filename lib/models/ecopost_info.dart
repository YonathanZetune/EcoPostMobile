import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class EcoPostInfo extends ChangeNotifier {
//  static File _image = File('');
////    width: MediaQuery.of(context).size.width,
////    height: 300,



  static String _description = "";

  static File _selectedImg = File(null);

  static String _tagged = "";


  static bool _shouldShowBack = false;
  static int _activeIndex = 0;

  static Key _selctedCardKey = Key(null);

  static String _challenge = "";

//  File get image => _image;

  bool get showMap => _shouldShowBack;

  File get selectedImg => _selectedImg;


  String get description => _description;

  int get activeIndex => _activeIndex;

  String get tagged => _tagged;

  String get challenge => _challenge;

//
//  set image(File img) {
//    _image = img;
//    notifyListeners();
//  }

  set showMap(bool needIt) {
    _shouldShowBack = needIt;
    notifyListeners();
  }

  set selectedImg(File needIt) {
    _selectedImg = needIt;
    notifyListeners();
  }

  set activeIndex(int needIt) {
    _activeIndex = needIt;
    notifyListeners();
  }

  set description(String needIt) {
    _description = needIt;
    notifyListeners();
  }

  set tagged(String needIt) {
    _tagged = needIt;
    notifyListeners();
  }

  set challenge(String needIt) {
    _challenge = needIt;
    notifyListeners();
  }
//  File get image => _image;

  Key get selctedCard => _selctedCardKey;

//
//  set image(File img) {
//    _image = img;
//    notifyListeners();
//  }

  set selectCard(Key needIt) {
    _selctedCardKey = needIt;
    notifyListeners();
  }
}
