import 'package:flutter/material.dart';
import 'package:toxic_products/view/pages/splash_screens/login_or_signup.dart';
void main(){
  runApp(MainPage());
}
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginorSignUp(),
    );
  }
}

