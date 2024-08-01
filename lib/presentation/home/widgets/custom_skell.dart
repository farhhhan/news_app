import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class custom_skel extends StatelessWidget {
  custom_skel({
  super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: SkeletonAnimation(
        child: Container(
          height: 330,
          decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
              color: Colors.grey),
        ),
      ),
    );
  }
}