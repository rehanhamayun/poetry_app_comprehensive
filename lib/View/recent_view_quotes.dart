import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shakespear_app/Provider_Controllers/recent_quotes_provider.dart';

class RecentQuotes extends StatelessWidget {
  const RecentQuotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recent = Provider.of<RecentQuotesSaver>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: recent.recentQuotes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Text(recent.recentQuotes[index].toString()),
                  );
                }),
          )
        ],
      ),
    );
  }
}
