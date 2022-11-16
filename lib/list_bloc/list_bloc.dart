import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../model/list_model.dart';
import '../services/api_repositry.dart';
import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final ApiRepository _apiRepository;
  int showLoading = 0;

  ListBloc({
    required ApiRepository apiRepository,
  })   : _apiRepository = apiRepository,
        super(ListInitial()) {
    on<listDetails>(ListEvent);
  }
  Future<void> ListEvent(
      listDetails event,
      Emitter<ListState> emit,
      ) async {
    try {
      emit(ListLoaded());
      bool result = await InternetConnectionChecker().hasConnection;
      if (result) {
        Response loadedResponse = await _apiRepository.listload();
        if(loadedResponse.statusCode == 200) {
          emit(ListReady(data: dataFromJson(loadedResponse.body)));
          print('=======-------------------------${loadedResponse.body}');

        }

      }
    } catch (e) {
      showLoading = 0;
      emit(ListError(message: e.toString()));
    }
  }

}


