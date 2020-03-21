import 'package:flutter/material.dart';

class StatusMain extends ChangeNotifier {
  bool status = false;

  void statusFn(){
    status = !status;
    notifyListeners();
  }
}
