import 'package:flutter/material.dart';
import 'package:hotstar1/pages/new&hot/coming_soon.dart';

class NewAndHot extends StatelessWidget {
  const NewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(5.0),
            child: TabBar(
                dividerColor: Colors.black,
                labelColor: Color.fromARGB(255, 255, 255, 255),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.white,
                labelStyle:
                    TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                unselectedLabelStyle:
                    TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                tabs: [
                  Tab(
                    text: 'Latest Releases',
                  ),
                  Tab(
                    text: 'Coming Soon',
                  ),
                ]),
          ),
        ),
        body: const TabBarView(
          children: [
          ThirdPage(),
          ThirdPage(),
        ]),
      ),
    );
  }
}