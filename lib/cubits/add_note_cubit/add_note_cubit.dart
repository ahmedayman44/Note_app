import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:notee_app/constants/constant.dart';
import 'package:notee_app/model/model_note.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

Color ? color = const Color(0xff394648);

  addNote(ModelNote note) async {
    note.color = color!.value ;
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
