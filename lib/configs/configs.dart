import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


final textHead = GoogleFonts.poppins(
  color: Colors.black,
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

final textHeadQ = GoogleFonts.poppins(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);

final colorMain = Color(0xFF10d0d6);

final unlikeIcon = Icon(Icons.favorite_border_outlined, color: Colors.black.withOpacity(0.4), size: 18,);
final likeIcon = Icon(Icons.favorite, color: Colors.red.withOpacity(0.8), size: 18,);



//Image
final userImage = "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80";

final textSaved = Text("No Quotes saved");