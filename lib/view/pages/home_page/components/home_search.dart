import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final IconData icons;
  final String txt;
  final TextEditingController? controller;
  const MyTextField({super.key, required this.icons, required this.txt,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color:Colors.teal.shade500),
            borderRadius: BorderRadius.circular(10),

          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: txt,
          hintStyle:
          GoogleFonts.josefinSans(fontSize: 15,color: Colors.blueGrey.shade900),
          prefixIcon: Icon(
            icons,
            color: Colors.blueGrey.shade900,
          )),
    );
  }
}
