import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shakespear_app/Models/poetry_model.dart';
import 'package:shakespear_app/Provider_Controllers/provider_saver.dart';

class PoetryMax extends StatelessWidget {
  PoetryMax({Key? key}) : super(key: key);

  List<ShakeModel> poetryList = [];
  Future<List<ShakeModel>> getPoetryApi() async {
    final response = await http
        .get(Uri.parse("https://poetrydb.org/author,title/Shakespeare;Sonnet"));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        poetryList.add(ShakeModel.fromJson(i));
      }
      return poetryList;
    } else {
      return poetryList;
    }
  }

// WE SHOW THE SAVED LISTS OF LINES OF THAT PARTICULAR TITLE THERE.
// i.e lister.savedlines[index] and the logic is in provider_saver.dart

  @override
  Widget build(BuildContext context) {
    final lister = Provider.of<ShowLines>(context);
    return Scaffold(
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
