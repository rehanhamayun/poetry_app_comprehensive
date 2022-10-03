import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shakespear_app/Models/poetry_model.dart';
import 'package:shakespear_app/Provider_Controllers/provider_saver.dart';

class PoetryMax extends StatelessWidget {
  final ShakeModel shakeModel;
  const PoetryMax({Key? key, required this.shakeModel}) : super(key: key);

// WE SHOW THE SAVED LISTS OF LINES OF THAT PARTICULAR TITLE THERE.
// i.e lister.savedlines[index] and the logic is in provider_saver.dart

  @override
  Widget build(BuildContext context) {
    final lister = Provider.of<ShowLines>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(shakeModel.title.toString().substring(10).replaceAll(":", "")),
        backgroundColor: Colors.black87,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(shakeModel.lines.toString(), style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 14,
            ),),
          ],
        ),
      ),
    );
  }
}
