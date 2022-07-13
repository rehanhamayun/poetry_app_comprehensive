import 'package:flutter/material.dart';

// THATS THE LOGIC FOR SAVING DATA WHEN USER CLICKS ON PARTICULAR TITLE.
// WE CREATE AN EMPTY LIST AND STORE ALL DATA HERE OF ONTAP OF USER.
// AFTER ALL, ITS ALL ABOUT INDEXES
class ShowLines with ChangeNotifier {
  List<String> _savedLines = [];

  List<String> get savedLines => _savedLines;

  void addLinesToSaved(String lines) {
    _savedLines.add(lines);
    notifyListeners();
  }
}
