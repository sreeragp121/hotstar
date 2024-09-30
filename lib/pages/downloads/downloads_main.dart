import 'package:flutter/material.dart';
import 'package:hotstar1/pages/navigation_bar/navigation_bar.dart';

class MyDownloads extends StatelessWidget {
  const MyDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Downloads",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'No Downloads Available',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Text(
              'Explore and download your favourite movies and shows to watch on the go',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const MyNavigationBar(),
              ));
            },
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: const Center(
                  child: Text(
                "Go to Home",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )),
            ),
          )
        ],
      ),
    );
  }
}