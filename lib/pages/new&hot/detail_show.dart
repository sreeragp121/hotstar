import 'package:flutter/material.dart';
import 'package:hotstar1/services/model_movies.dart';

Row detailsrow({required Movie details}) {
  return Row(
    children: [
      const SizedBox(
        width: 10,
      ),
      Text(
        details.language,
        style: TextStyle(color: Colors.grey[400]),
      ),
      dot(),
      Container(
        height: 18,
        width: 25,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(2)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "A",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      dot(),
      Text(
        "Biopic",
        style: TextStyle(color: Colors.grey[400]),
      ),
      dot(),
      Text(
        "Drama",
        style: TextStyle(color: Colors.grey[400]),
      ),
      dot(),
      Text(
        "Celebrities",
        style: TextStyle(color: Colors.grey[400]),
      )
    ],
  );
}

SizedBox dot() {
  return SizedBox(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        Icons.circle,
        size: 6,
        color: Colors.grey[400],
      ),
    ),
  );
}
