import 'package:flutter/material.dart';
import 'package:notee_app/views/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        
        Text(
          'Notes',
          style: TextStyle(fontSize: 30),
        ),
        Spacer(),
        CustomSearchIcon()
      ],
    );
  }
}
