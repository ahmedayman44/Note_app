import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notee_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notee_app/model/model_note.dart';

import 'package:notee_app/views/widgets/custom_button.dart';

import 'package:notee_app/views/widgets/custom_text_field.dart';

class AddNoteModelSheet extends StatelessWidget {
  const AddNoteModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (State is AddNoteSuccess) {
              Navigator.pop(context);
            }
            if (State is AddNoteFailed) {
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text(state.errMessage)),
              // );
            }
          },
          builder: (context, state) {
            return const ModalProgressHUD(
              inAsyncCall: State is AddNoteLoading ? true : false,
              child: SingleChildScrollView(
                child: AddNoteForm(),
              ),
            );
          },
        ),
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
            height: 60,
          ),
          CustomButton(
              // here Validate input data
              onTap: () {
            // heere we validate input data before save it in hive
            if (formKey.currentState!.validate()) {
              // here we save data in hive
              formKey.currentState!.save();

              var modelNote = ModelNote(
                  title: title!,
                  subtitle: subtitle!,
                  date: DateTime.now().toString(),
                  color: Colors.red.value);
              BlocProvider.of<AddNoteCubit>(context).addNote(modelNote);
            } else {
              // here we show error when input data is wrong and some data is null
              autovalidateMode = AutovalidateMode.always;
              setState(() {});
            }
          })
        ],
      ),
    );
  }
}
