import 'package:flutter/material.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 24,
        left: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffffcd7a),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              'Flutter Tips',
              style: TextStyle(
                  color: Colors.black, fontSize: 24, fontFamily: 'Poppins'),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 10),
              child: Text(
                'Build Your Career With thrwat samy',
                style: TextStyle(
                    fontSize: 14, color: Colors.black.withOpacity(0.5)),
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete, color: Colors.black)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 33),
            child: Text('May22 , 2024',
                style: TextStyle(color: Colors.black.withOpacity(.5))),
          )
        ],
      ),
    );
  }
}
