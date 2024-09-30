import 'package:flutter/material.dart';
import 'package:hotstar1/pages/downloads/downloads_main.dart';
import 'package:hotstar1/pages/home/home_main.dart';
import 'package:hotstar1/pages/my_space/my_space_main.dart';
import 'package:hotstar1/pages/new&hot/new_hot_main.dart';
import 'package:hotstar1/pages/search/search_main.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int currentIndex = 0;

  final List pages = [
    const MyHomeMain(),
    const MySearch(),
    const NewAndHot(),
    const MyDownloads(),
    const MySpace(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex], 

      bottomNavigationBar: BottomNavigationBar(
         backgroundColor: Colors.black,
         unselectedItemColor: Colors.grey,
         selectedItemColor: Colors.white,
         iconSize: 20,
         unselectedLabelStyle: const TextStyle(
          fontSize: 10
         ),
         selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold
         ),
         selectedFontSize: 10,
         type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex, 
        onTap: (index) {
          setState(() {
            currentIndex = index; 
          });
        },
        items: const [
          BottomNavigationBarItem( 
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bolt),
            label: 'New & Hot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download_outlined),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Space',
          ),
        ],
      ),
    );
  }
}
