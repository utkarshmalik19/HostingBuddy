import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';

import 'alerts_event.dart';
import 'alerts_state.dart';

class AlertsBloc extends Bloc<AlertsEvent, AlertsState> {
  AlertsBloc() : super(AlertsInitial()) {
    on<AddAlert>(_mapAlertToState);
  }

  Future _mapAlertToState(AddAlert event, Emitter<AlertsState> emit) async {
    int id = new Random().nextInt(200);
    emit(AlertMessage(message: event.message, id: id));
  }
}
