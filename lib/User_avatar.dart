import 'package:flutter/material.dart';

class Useravatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          width: 3,
          color: Colors.white,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0),
          )
        ],
        image: DecorationImage(
            image: AssetImage("assets/images/user_avatar.jpg"),
            fit: BoxFit.cover),
      ),
    );
  }
}
