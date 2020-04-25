import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class EcoPostInfo extends ChangeNotifier {
//  static File _image = File('');
////    width: MediaQuery.of(context).size.width,
////    height: 300,

  static bool _shouldShowBack = false;
  static Key _selctedCardKey = Key(null);

//  File get image => _image;

  bool get showMap => _shouldShowBack;

//
//  set image(File img) {
//    _image = img;
//    notifyListeners();
//  }

  set showMap(bool needIt) {
    _shouldShowBack = needIt;
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
