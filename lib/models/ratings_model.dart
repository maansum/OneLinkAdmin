import 'package:flutter/material.dart';

class RatingsChangeNotifier extends ChangeNotifier {
  int _rating = 0;
  int get rating => _rating;
  void setrating(int rating) {
    _rating =  rating + 1 == _rating ? 0 : rating + 1;
    notifyListeners();
  }
}
