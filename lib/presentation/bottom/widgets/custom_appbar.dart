import 'package:flutter/material.dart';

AppBar buildCustomAppBar() {
  return AppBar(
    toolbarHeight: 100, // Increased height for better image visibility
    backgroundColor: Colors.white54, // Ensure AppBar itself is transparent
    elevation: 2, // Remove shadow to make the gradient stand out
    leading: SizedBox(
      width: 140, // Increased width to make the image larger
      height: 140, // Increased height to make the image larger
      child: Image.asset(
        'images/news_logo.png',
        fit: BoxFit.contain, // Ensures the image fits within the bounds
      ),
    ),
    title: ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: <Color>[Colors.black, Colors.red],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bounds);
      },
      child: const Text(
        "KUMUDAM NEWS",
        style: TextStyle(
          fontWeight: FontWeight.w900, // Making the text bold
          fontSize: 26, // Adjust font size as needed
          color: Colors.white, // Color doesn't matter due to ShaderMask
        ),
      ),
    ),
  );
}
