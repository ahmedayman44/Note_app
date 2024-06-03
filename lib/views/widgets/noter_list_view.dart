import 'package:flutter/cupertino.dart';
import 'package:notee_app/views/widgets/custom_note_item.dart';

class NotesItemListView extends StatelessWidget {
  const NotesItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context , index){
             return const Padding(
               padding:  EdgeInsets.symmetric(vertical: 5.0),
               child: CustomNoteItem(),
             );
    });
  }
}