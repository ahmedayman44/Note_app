import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/notes/notes_cubit.dart';
import '../../model/model_note.dart';
import '../edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});

  final ModelNote note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return  EditNotesView(
               note: note,
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color:  Color(note.color),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(
                    color: Colors.black, fontSize: 24, fontFamily: 'Poppins'),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 10),
                child: Text(
                  note.subtitle,
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.5)),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();

                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: const Icon(Icons.delete, color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 33),
              child: Text(
                note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
