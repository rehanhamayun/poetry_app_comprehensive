import 'package:flutter/material.dart';

class FavoriteQuoteSaver with ChangeNotifier {
  List<String> _favoriteQuote = [];
  List<String> get favoriteQuote => _favoriteQuote;

  void addFavoriteQuote(String favorite) {
    _favoriteQuote.add(favorite);
    notifyListeners();
  }

  void removeFavorite(String favorite) {
    _favoriteQuote.remove(favorite);
    notifyListeners();
  }
}
