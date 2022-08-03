import 'package:flutter/material.dart';

class EmptyItem extends StatelessWidget {
  const EmptyItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Check your network",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "one",
            color: Colors.grey.shade400,
            fontSize: MediaQuery.of(context).size.shortestSide * .07),
      ),
    );
  }
}
