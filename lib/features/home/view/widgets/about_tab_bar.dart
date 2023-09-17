import 'package:flutter/material.dart';

class AboutTabBar extends StatelessWidget {
  final String description;
  const AboutTabBar({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return  Text(description);
  }
}
