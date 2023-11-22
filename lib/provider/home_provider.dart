import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  int currentPageIndex = 0;

  void updateIndex(int index) {
    currentPageIndex = index;
    notifyListeners();
  }
}
