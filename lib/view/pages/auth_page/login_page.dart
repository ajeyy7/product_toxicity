import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toxic_products/view/pages/auth_page/components/container_login.dart';
import 'package:toxic_products/view/pages/auth_page/signup_page.dart';
import 'package:toxic_products/view/pages/home_page/home_page.dart';
import 'components/textfeild_login_signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  late SharedPreferences preferences;
  late bool newuser;

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
                    Text(
                      "Login to continue",
                      style: GoogleFonts.josefinSans(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.teal),
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
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      AuthTextField(
                        txt: 'Email',
                        icons: Icons.email_outlined,
                        controller: emailcontroller,
                        obstxt: false,
                      ),
                      AuthTextField(
                        txt: 'Password',
                        icons: Icons.visibility_outlined,
                        controller: passcontroller,
                        obstxt: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 220),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                  LConatiner(
                      txt: "Login",
                      ontap: () {
                        checkandLogin();
                      }),
                  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignUp()));
                          },
                          child: Text(
                            "Register now",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade900),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  void checkandLogin() async {
    preferences = await SharedPreferences.getInstance();
    String regemail = preferences.getString('regemail')??"";
    String regpass = preferences.getString('regpass')??"";

    String logemail = emailcontroller.text.trim();
    String logpass = passcontroller.text.trim();
    preferences.setBool('newuser', false);
    if(logemail.isNotEmpty&&logpass.isNotEmpty) {
      if (regemail == logemail && regpass == logpass) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (C) => HomePage()));
      }

      else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("email and password doesnt match")));
      }
    }else
    {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("both fields needs to be filled")));
    }
  }
}
