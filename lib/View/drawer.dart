import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shakespear_app/Login_routes/auth_services.dart';
import 'package:shakespear_app/Login_routes/login.dart';
import 'package:shakespear_app/Provider_Controllers/favorite_quote_provider.dart';
import 'package:shakespear_app/Provider_Controllers/provider_saver.dart';
import 'package:shakespear_app/View/extras.dart';
import 'package:shakespear_app/View/favorite_quotes.dart';
import 'package:shakespear_app/View/recent_view_quotes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lister = Provider.of<ShowLines>(context);
    final adder = Provider.of<FavoriteQuoteSaver>(context);
    final authService = Provider.of<AuthService>(context);

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(45,150,45,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(CupertinoIcons.profile_circled, ),
                SizedBox(width: 10,),

                Text("My Profile", style: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                 ),

                //

              ],
            ),

            SizedBox(height: 50,),



            GestureDetector(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=> FavoriteQuotes()));
              },
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(CupertinoIcons.square_favorites, ),
                  SizedBox(width: 10,),

                  Text("Saved Quotes", style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ), ),

                  //

                ],
              ),
            ),


            SizedBox(height: 50,),


            Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(CupertinoIcons.search, ),
                SizedBox(width: 10,),

                Text("Search", style: GoogleFonts.poppins(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ), ),

                //

              ],
            ),

            SizedBox(height: 200,),

            GestureDetector(
              onTap: (){
                authService.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
              },
              child: Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 10,),
                  Text("Logout",  style: GoogleFonts.poppins(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
