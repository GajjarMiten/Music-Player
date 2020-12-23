import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyAppbar extends StatelessWidget {
  const MyAppbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        "All Songs",
        style: GoogleFonts.bellota(
            fontSize: 26, fontWeight: FontWeight.bold),
      ),
      expandedHeight: 100,
    );
  }
}