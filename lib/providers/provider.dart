import 'package:flutter/material.dart';


class ButtonProvider with ChangeNotifier {
  int currentIndex = -1;

  //change card color as per selected
  void changeButtonColor(int selectIndex) {
    currentIndex = selectIndex;
    notifyListeners();
  }


//reset card color
  void resetButtonColor(
      {Duration duration = const Duration(milliseconds: 100)}) {
    Future.delayed(duration, () {
      currentIndex = -1;
      notifyListeners();
    });
  }
}
