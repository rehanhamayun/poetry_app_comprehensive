import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakespear_app/Provider_Controllers/favorite_quote_provider.dart';

import 'package:shakespear_app/Provider_Controllers/recent_quotes_provider.dart';

class FavoriteQuotes extends StatelessWidget {
  const FavoriteQuotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<FavoriteQuoteSaver>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("Saved Quotes"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favorite.favoriteQuote.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Text(favorite.favoriteQuote[index].toString()),
                  );
                }),
          )
        ],
      ),
    );
  }
}
