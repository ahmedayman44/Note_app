import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notee_app/constants/constant.dart';
import 'package:notee_app/model/model_note.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(ModelNote note) async {
    emit(AddNoteLoading());
    try {
      var box = Hive.box<ModelNote>(kNoteBox);

      await box.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailed(e.toString()));
    }
  }
}
