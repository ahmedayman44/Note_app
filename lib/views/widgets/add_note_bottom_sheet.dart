import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notee_app/views/widgets/custom_button.dart';

import 'package:notee_app/views/widgets/custom_text_field.dart';

class AddNoteModelSheet extends StatelessWidget {
  const AddNoteModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              SizedBox(
                height: 95,
              ),
              CustomButton()
            ],
          ),
        ),
      ),
    );
  }
}
