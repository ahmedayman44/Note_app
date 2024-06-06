import 'package:flutter/material.dart';
import 'package:notee_app/constants/constant.dart';
import 'package:notee_app/views/notes_view.dart';
// hive_flutter package used to show initflutter()
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();

  //openbox used to stor data ==> you can see about it  collection
  await Hive.openBox(kNoteBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark ,
        fontFamily: 'Poppins',
        ),
        home: const NotesView());
  }
}
