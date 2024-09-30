// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hotstar1/pages/navigation_bar/navigation_bar.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    goToHomePage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF003366),
              Color.fromARGB(255, 9, 202, 154),
            ],
          ),
        ),
        child: Center(
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('assets/logo/logo.png'),),
        ),
      ),
    );
  }

 void goToHomePage()async{
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyNavigationBar()),);
  }
}
