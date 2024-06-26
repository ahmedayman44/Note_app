import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import '../../constants/constant.dart';
import '../../model/model_note.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<ModelNote>? notes;

  fetchAllNotes() async {
    var box = Hive.box<ModelNote>(kNoteBox);

    notes = box.values.toList();
    emit(NotesSucess());
  }
}
