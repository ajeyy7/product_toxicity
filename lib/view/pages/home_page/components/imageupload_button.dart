import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Custom_Button extends StatelessWidget {
  final String txt;
  final IconData icons;
  final void Function()? ontap;
  const Custom_Button({super.key, required this.txt, required this.icons, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 55,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:Colors.teal.shade300,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                color: Colors.grey.shade400,
                blurRadius: 4,
                spreadRadius: 1
              )
            ]
          ),
          child: Center(
            child: Row(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
                Icon(icons,color: Colors.white),
                SizedBox(width: 10),
                Text(txt,style: GoogleFonts.josefinSans(fontSize: 15,color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
