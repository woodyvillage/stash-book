import 'package:flutter/foundation.dart';

class NavigatorPositionService extends ChangeNotifier {
  int selectedRoute = 0;

  void changed(int index) {
    selectedRoute = index;
    if (kDebugMode) {
      print("changed:$selectedRoute");
    }
    notifyListeners();
  }
}
