import 'package:flutter/material.dart';

class LConatiner extends StatelessWidget {
  final String txt;
  final void Function()? ontap;
  const LConatiner({super.key, required this.txt, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28,right: 28,top: 18,),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 50,
          width: 380,
          decoration: BoxDecoration(
            color: Colors.teal.shade700,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3)
              )
            ]
          ),
          child: Center(child: Text(txt,style: TextStyle(color: Colors.grey.shade50),)),

        ),
      ),
    );
  }
}
