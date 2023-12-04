import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toxic_products/view/pages/auth_page/login_page.dart';
import '../home_page/home_page.dart';
import 'components/container_login.dart';
import 'components/textfeild_login_signup.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  late SharedPreferences preferences;

  

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
                    Text("SignUp to continue",
                        style: GoogleFonts.josefinSans(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.teal))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      AuthTextField(
                        txt: 'Username',
                        icons: Icons.person_3_outlined,
                        controller: usernamecontroller,
                        obstxt: false,
                      ),
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
                    ],
                  ),
                  LConatiner(
                      txt: "SignUp",
                      ontap: () {
                        storeData();
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a user?"),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => LoginPage()));
                          },
                          child: Text(
                            "Login Now",
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

  void storeData() async {
    String usernamee = usernamecontroller.text.trim();
    String emailee = emailcontroller.text.trim();
    String passwordee = passcontroller.text.trim();
    if (usernamee.isNotEmpty && emailee.isNotEmpty && passwordee.isNotEmpty) {
      preferences = await SharedPreferences.getInstance()!;
      preferences.setString('regusrname', usernamee);
      preferences.setString('regemail', emailee);
      preferences.setString("regpass", passwordee);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("All fields Must be filled"),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
  }
}
