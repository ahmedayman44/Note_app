import 'package:flutter/material.dart';
import 'package:notee_app/views/widgets/custom_app_bar.dart';
import 'package:notee_app/views/widgets/noter_list_view.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

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
            text: 'Notes',
            icon: Icons.search,
          ),
          //expanded to privent limit size of listview ==>use in widget Row And Column
          Expanded(
            child: NotesItemListView(),
          )
        ],
      ),
    );
  }
}
