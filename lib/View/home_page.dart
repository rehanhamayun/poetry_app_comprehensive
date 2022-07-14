import 'dart:convert';

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shakespear_app/Models/poetry_model.dart';
import 'package:shakespear_app/Provider_Controllers/favorite_quote_provider.dart';
import 'package:shakespear_app/Provider_Controllers/provider_saver.dart';
import 'package:shakespear_app/Provider_Controllers/recent_quotes_provider.dart';
import 'package:shakespear_app/View/drawer.dart';
import 'package:shakespear_app/View/poetry_max.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// API CALL USING MODEL
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

  @override
  Widget build(BuildContext context) {
    final lister = Provider.of<ShowLines>(context);
    final recent = Provider.of<RecentQuotesSaver>(context);
    final favorite = Provider.of<FavoriteQuoteSaver>(context);
    bool _changeColor = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text("ShakeSpear Quotes"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
            future: getPoetryApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: CircularProgressIndicator(
                  //backgroundColor: Colors.black,
                  color: Colors.black,
                ));
              } else {
                return Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: poetryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 0.0,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      recent.addRecentQuote(
                                          poetryList[index].title.toString());
                                      //HERE WE COME THE MAIN LOGIC

                                      // WE CREATE PROVIDER LOGIC TO SAVED THE LINES OF PARTICULAR TITLE.
                                      //  PROVIDER SHOWLINES IS THE LOGIC WE CREATE TO STORE INFO OF PARTICULAR TITLE.
                                      // WE SAVED LINES OF PARTICULAR TITLE USER CLICKS AND ALSO NAVIGATE DIRECTLY SO 2 BENEFITS ADDED
                                      lister.addLinesToSaved(
                                          poetryList[index].lines.toString());

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PoetryMax()));
                                    },
                                    child: Container(
                                      height: 150,
                                      width: 300,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              poetryList[index]
                                                  .title
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                   // Container need to add here

                                InkWell(
                                  onTap: (){

                                    favorite.addFavoriteQuote(poetryList[index].title.toString());
                                    setState(() {
                                      _changeColor = true;
                                    });
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color:  _changeColor==true ? Colors.amber : Colors.black,
                                      borderRadius: BorderRadius.circular(10
                                      ),
                                    ),
                                  ),
                                ),


                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }
            },
          ),
          // ElevatedButton(onPressed: () {}, child: Text("=>"))
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
