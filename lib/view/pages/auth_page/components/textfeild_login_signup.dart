import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String txt;
  final IconData icons;
  final TextEditingController? controller;
  final bool obstxt;
  const AuthTextField({super.key, required this.txt, required this.icons, required this.controller, required this.obstxt});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29,vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obstxt,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(

                  color: Colors.teal.shade400),
              borderRadius: BorderRadius.circular(8),

            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: txt,
            hintStyle:
            TextStyle(color: Colors.grey.shade400),
            prefixIcon: Icon(
              icons,
              color: Colors.green.shade200,
            )),
      ),
    );
  }
}
