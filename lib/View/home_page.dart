import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shakespear_app/Models/poetry_model.dart';
import 'package:shakespear_app/Provider_Controllers/favorite_quote_provider.dart';
import 'package:shakespear_app/Provider_Controllers/provider_saver.dart';
import 'package:shakespear_app/Provider_Controllers/recent_quotes_provider.dart';
import 'package:shakespear_app/View/drawer.dart';
import 'package:shakespear_app/View/poetry_max.dart';
import 'package:shakespear_app/configs/configs.dart';
import 'package:sizer/sizer.dart';


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

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),

      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),

       

        //centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left:22),
            child: Row(

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Shake Speare Quotes", style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 9,),
                    Text("Total Quotes: 150", style: GoogleFonts.poppins(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 12,
                    ),),
                  ],
                ),

              ],

            ),
          ),
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
                    child: ListView.builder(itemCount: poetryList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 15.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.circular(25),
                              ),

                              // SubString method to remove first few digits from the fetch data
                              //It removes first 9 digits of fetch data in List String.
                              child: Column(
                                // main
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0,5,18,0),
                                          child: GestureDetector(
                                            onTap: (){

                                              favorite.addFavoriteQuote(poetryList[index].title.toString());
                                            },
                                            child: Container(

            // Favorite Button Logic added.
                                                child:  favorite.favoriteQuote.contains(poetryList[index].title) ? likeIcon : unlikeIcon  ),
                                          ),
                                        ),
                                        ],
                                    ),
                                  ),
                                  //Text(poetryList[index].title.toString().substring(9)),
                                ],
                              ),
                            ),
                          );
                        }
                    ));
              }


              // ElevatedButton(onPressed: () {}, child: Text("=>"))
            })],
      ),
      drawer: MyDrawer(),
    );
  }
}

