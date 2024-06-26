import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/constant.dart';
import 'cubits/notes/notes_cubit.dart';
import 'model/model_note.dart';
import 'simple_bloc_observer.dart';
import 'views/notes_view.dart';
// hive_flutter package used to show initflutter()
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleObserveer();
  //openbox used to stor data ==> you can see about it  collection
  Hive.registerAdapter(ModelNoteAdapter());
  await Hive.openBox<ModelNote>(kNoteBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
