import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notee_app/constants/constant.dart';
import 'package:notee_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notee_app/model/model_note.dart';
import 'package:notee_app/simple_bloc_observer.dart';
import 'package:notee_app/views/notes_view.dart';
// hive_flutter package used to show initflutter()
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleObserveer();
  //openbox used to stor data ==> you can see about it  collection
  await Hive.openBox<ModelNote>(kNoteBox);
  Hive.registerAdapter(ModelNoteAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            fontFamily: 'Poppins',
          ),
          home: const NotesView()),
    );
  }
}
