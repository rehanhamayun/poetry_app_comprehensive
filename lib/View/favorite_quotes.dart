import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shakespear_app/Provider_Controllers/favorite_quote_provider.dart';
import 'package:sizer/sizer.dart';


class FavoriteQuotes extends StatelessWidget {
  const FavoriteQuotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<FavoriteQuoteSaver>(context);
    return Scaffold(
      backgroundColor: Colors.white,
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
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height:17.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(favorite.favoriteQuote[index].isEmpty ? "No Quotes Saved" : favorite.favoriteQuote[index].toString().substring(10).replaceAll(":", ""),  style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,

                          ),  ),
                          SizedBox(height: 12,),
                          GestureDetector(
                            onTap: (){},
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(right:20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [

                                    Text("Read", style: GoogleFonts.poppins(
                                      color: Colors.black.withOpacity(0.6),
                                      fontWeight: FontWeight.w600, fontSize: 12,
                                    ), ),
                                    SizedBox(width: 5,),
                                    Icon(CupertinoIcons.book, size: 12,),


                                  ],
                                ),
                              ),
                            ),
                          ),



                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
