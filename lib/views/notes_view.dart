import 'package:flutter/material.dart';
import 'package:notee_app/views/widgets/add_note_bottom_sheet.dart';
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
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return const AddNoteModelSheet();
                  });
            },
            icon: const Icon(
              Icons.add,
              size: 22,
            )),
      ),
      body: const NotesViewBody(),
    );
  }
}
