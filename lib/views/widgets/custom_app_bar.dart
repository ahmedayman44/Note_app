import 'package:flutter/material.dart';
import 'package:notee_app/views/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 25),
        ),
        const Spacer(),
        CustomSearchIcon(
          icon: icon,
        ),
      ],
    );
  }
}
