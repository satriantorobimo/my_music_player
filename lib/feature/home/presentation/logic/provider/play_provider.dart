import 'package:flutter/material.dart';

class PlayProvider extends ChangeNotifier {
  String _value;
  String _image;
  String _url;
  bool _isPlay = false;
  String get value => _value;
  String get url => _url;
  String get image => _image;
  bool get isplay => _isPlay;

  void addState(String value, String image, bool play, String url) {
    _value = value;
    _image = image;
    _isPlay = play;
    _url = url;
    notifyListeners();
  }
}
