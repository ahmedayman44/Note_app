import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';


// simple bloc observer is used to see changes of states in the app
class SimpleObserveer implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint('Change : $change');
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint('Close : $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint('Create : $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
