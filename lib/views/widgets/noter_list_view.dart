import 'package:flutter/cupertino.dart';
import 'package:notee_app/views/widgets/custom_note_item.dart';

class NotesItemListView extends StatelessWidget {
  const NotesItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context , index){
               return const Padding(
                 padding:  EdgeInsets.symmetric(vertical: 5.0),
                 child: CustomNoteItem(),
               );
      }),
    );
  }
}