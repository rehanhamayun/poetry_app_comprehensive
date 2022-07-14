import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakespear_app/Provider_Controllers/favorite_quote_provider.dart';
import 'package:shakespear_app/Provider_Controllers/provider_saver.dart';
import 'package:shakespear_app/View/extras.dart';
import 'package:shakespear_app/View/recent_view_quotes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lister = Provider.of<ShowLines>(context);
    final favorite = Provider.of<FavoriteQuoteSaver>(context);
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            "Recent View Quotes",
            style: textHead,
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            lister.savedLines.length.toString(),
            style: textHeadQ,
          ),
          SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RecentQuotes()));
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Proceed",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Text(
            "Favorite Quotes",
            style: textHead,
          ),
          SizedBox(
            height: 40,
          ),
          Text(favorite.favoriteQuote.length.toString()),
          GestureDetector(
            onTap: () {
              //   Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => RecentQuotes()));
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "Proceed",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Text(
            "ShakeSpear Quotes.\nAll rights reserved @2022.",
            style: TextStyle(
                color: Colors.grey.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
