import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_1/main_view_model.dart';
import 'package:test_1/model.dart';

// call event as input. Every time there is action, it can be put into the event
class EventsHandler extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchData extends EventsHandler {}

// every time you want response, it can be put into the state
class StateHandler extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Loading extends StateHandler {}

class Loaded extends StateHandler {
  final ElixirsList elixirsList; // dio
  //List<dynamic> elixirsList; // http
  Loaded(this.elixirsList);
}

class Error extends StateHandler {
  final String? msg;
  Error(this.msg);
}

// Bloc is the place to put logic. It acts as a middle man between UI and data layer.
// Bloc takes an event triggered by the user as an input, and responds back to the ui 
// with the relevant state
class BlocHandler extends Bloc<EventsHandler, StateHandler> {
  final MainViewModel mainViewModel = MainViewModel();
  BlocHandler() : super(Loading()) {
    // on<> : Register event handler for an event
    on<FetchData>((event, emit) async {
      try {
        emit(Loading());
        final dioList = await mainViewModel.getData();
        final httpList = await mainViewModel.fetchDataList();
        emit(Loaded(dioList));
        //emit(Loaded(httpList));
      } catch (e) {
        //throw Exception(e);
        emit(Error("Error!"));
      }
    });
  }  
}