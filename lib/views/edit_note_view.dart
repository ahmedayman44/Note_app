import 'package:flutter/material.dart';
import '../model/model_note.dart';
import 'widgets/edit_note_view_body.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key, required this.note});

final ModelNote note;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EditNoteViewBody(
        note: note,
      ),
    );
  }
}
