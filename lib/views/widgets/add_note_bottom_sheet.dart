import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../cubits/notes/notes_cubit.dart';
import '../../model/model_note.dart';
import 'colors_list_view.dart';

import 'custom_button.dart';

import 'custom_text_field.dart';

class AddNoteModelSheet extends StatelessWidget {
  const AddNoteModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (State is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
          if (State is AddNoteFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Something went wrong'),
              ),
            );
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  //used to show error when entre wrong input(data)
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey = GlobalKey();

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 33,
          ),
          CustomTextField(
            onsaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onsaved: (value) {
              subtitle = value;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 40,
          ),
          const ColorListView(),
          const SizedBox(
            height: 40,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                // here Validate input data
                onTap: () {
                  // heere we validate input data before save it in hive
                  if (formKey.currentState!.validate()) {
                    // here we save data in hive
                    formKey.currentState!.save();

                    var currentDate = DateTime.now();

                    var formattedCurrentDate =
                        DateFormat('dd-mm-yyyy').format(currentDate);

                    var modelNote = ModelNote(
                        title: title!,
                        subtitle: subtitle!,
                        date: formattedCurrentDate,
                        color: Colors.red.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(modelNote);
                  } else {
                    // here we show error when input data is wrong and some data is null
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }

                  Navigator.pop(context);
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
