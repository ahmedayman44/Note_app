import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notee_app/cubits/notes/notes_cubit.dart';
import 'package:notee_app/model/model_note.dart';
import 'package:notee_app/views/widgets/custom_app_bar.dart';
import 'package:notee_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final ModelNote note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title ; 
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.save();

              BlocProvider.of<NotesCubit>(context).fetchAllNotes();

              Navigator.pop(context);
            },
            text: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 33,
          ),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hintText: widget.note.title,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hintText: widget.note.subtitle,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
