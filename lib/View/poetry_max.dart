import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shakespear_app/Provider_Controllers/provider_saver.dart';

class PoetryMax extends StatelessWidget {
  PoetryMax({Key? key}) : super(key: key);

// WE SHOW THE SAVED LISTS OF LINES OF THAT PARTICULAR TITLE THERE.
// i.e lister.savedlines[index] and the logic is in provider_saver.dart

  @override
  Widget build(BuildContext context) {
    final lister = Provider.of<ShowLines>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: lister.savedLines.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Text(lister.savedLines[index].toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
