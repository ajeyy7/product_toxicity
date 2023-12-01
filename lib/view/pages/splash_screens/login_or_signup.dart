import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toxic_products/view/pages/auth_page/components/container_login.dart';
import 'package:toxic_products/view/pages/auth_page/signup_page.dart';

import '../auth_page/login_page.dart';

class LoginorSignUp extends StatefulWidget {
  const LoginorSignUp({super.key});

  @override
  State<LoginorSignUp> createState() => _LoginorSignUpState();
}

class _LoginorSignUpState extends State<LoginorSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/pexelbg.jpg"),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Icon(Icons.ac_unit_outlined,size: 50,weight: 20,color: Colors.teal),
                    Text(
                      "Welcome",
                        style: GoogleFonts.josefinSans(
                            fontSize: 40,
                            // fontWeight: FontWeight.w500,
                            color: Colors.teal)
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey.shade100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20,horizontal: 24),
                  child: Text("Create an account to get started OR Signup",
                      style: GoogleFonts.josefinSans(
                          fontSize: 35,
                          // fontWeight: FontWeight.w500,
                          color: Colors.teal)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      LConatiner(txt: 'Login', ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                      },),
                      LConatiner(txt: 'SignUp', ontap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
                      },)
                    ],
                  ),
                ),

              ],
            ),
          ))
        ],
      ),
    );
  }
}
