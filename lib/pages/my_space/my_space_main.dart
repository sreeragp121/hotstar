import 'package:flutter/material.dart';

class MySpace extends StatelessWidget {
  const MySpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: AppBar(
          backgroundColor: Colors.black,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(image: AssetImage("assets/logo/logo.png")),
          ),
          actions: const [
            Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Help&Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                )
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Login to Disney+Hotstar",
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              textAlign: TextAlign.center,
              "Start watching from where you left off,personalise for kids and more",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 200,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 21, 2, 192),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
                child: Text(
              "Log In",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Having trouble logging in?",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Get Help",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    );
  }
}
