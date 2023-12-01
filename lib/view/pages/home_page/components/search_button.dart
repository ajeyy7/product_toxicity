import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search_Button extends StatelessWidget {
  final String txt;
  final IconData icons;
  final void Function()? ontap;
  const Search_Button({super.key, required this.txt, required this.icons, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical:15),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:Colors.teal.shade500,
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 5),
                    color: Colors.grey.shade400,
                    blurRadius: 4,
                    spreadRadius: 1
                )
              ]
          ),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
              Icon(icons,color: Colors.white),
              SizedBox(width:5),
              Text(txt,style: GoogleFonts.josefinSans(fontSize: 15,color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
