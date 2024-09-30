import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 5),
       child: TextFormField(
           decoration: InputDecoration(
               filled: true,
               fillColor: Colors.grey[200],
               hintText: 'Movies, shows and more',
               prefixIcon: IconButton(
                   onPressed: () {},
                   icon: const Icon(
                     Icons.search,
                     size: 25,
                   )),
               suffixIcon: IconButton(
                   onPressed: () {},
                   icon: const Icon(
                     Icons.mic_none,
                     size: 25,
                   )),
               border: const OutlineInputBorder(
                   borderRadius: BorderRadius.all(Radius.circular(10))))),
     );
  }
}