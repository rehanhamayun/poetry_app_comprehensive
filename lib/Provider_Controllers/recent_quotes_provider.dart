import 'package:flutter/material.dart';

class RecentQuotesSaver with ChangeNotifier {
  final List<String> _recentQuotes = [];
  List<String> get recentQuotes => _recentQuotes;

  void addRecentQuote(String recentOnes) {
    _recentQuotes.add(recentOnes);
    notifyListeners();
  }
}
