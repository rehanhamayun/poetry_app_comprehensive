import 'package:flutter/material.dart';

class FavoriteQuoteSaver with ChangeNotifier {
  List<String> _favoriteQuote = [];
  List<String> get favoriteQuote => _favoriteQuote;

  void addFavoriteQuote(String adder) {
    _favoriteQuote.add(adder);
    notifyListeners();
  }

  void removeFavorite(String adder) {
    _favoriteQuote.remove(adder);
    notifyListeners();
  }
}
