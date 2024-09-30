import 'package:flutter/material.dart';

class HorizontalViewItems extends StatefulWidget {
  const HorizontalViewItems({super.key});

  @override
  State<HorizontalViewItems> createState() => _HorizontalViewItemsState();
}

class _HorizontalViewItemsState extends State<HorizontalViewItems> {
  List<String> items = [
    'India',
    'Movies',
    'Shows',
    'Action',
    'Comedy',
    'Crime',
    'Drama',
    'Romance',
    'Triller',
    'Horror'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text(
            'Trending in',
            style: TextStyle(
              color: Color.fromARGB(255, 219, 217, 217),
              fontSize: 20,
              fontWeight: FontWeight.bold
              ),
            
          ),
        ),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                      child: Text(
                        items[index],
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
