import 'package:flutter/material.dart';
import 'package:notee_app/views/widgets/custom_app_bar.dart';
import 'package:notee_app/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          CustomAppBar(
            text: 'Edit Note',
            icon: Icons.check,
          ),
          SizedBox(
                height: 33,
              ),
              CustomTextField(
                hintText: 'Title',
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                hintText: 'Content',
                maxLines: 5,
              ),
        ],
      ),
    );
  }
}
