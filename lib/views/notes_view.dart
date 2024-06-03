import 'package:flutter/material.dart';
import 'package:notee_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xff55eed8),
        ),
        child: IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 25,
            )),
      ),
      body: const NotesViewBody(),
    );
  }
}
