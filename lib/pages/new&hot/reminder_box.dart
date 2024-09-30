import 'package:flutter/material.dart';


Container remindmebox({required String releasedate}) {
  return Container(
    height: 55,
    width: 370,
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.notifications_none_outlined,
          size: 35,
        ),
        const Text(
          " Remind Me",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(releasedate)
      ],
    ),
  );
}