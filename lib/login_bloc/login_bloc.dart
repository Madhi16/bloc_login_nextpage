import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../services/api_repositry.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepository _apiRepository;
  int showLoading = 0;
  final JsonDecoder _decoder = const JsonDecoder();

  LoginBloc({
    required ApiRepository apiRepository,
  })   : _apiRepository = apiRepository,
        super(LoginInitial()) {
    on<LoginDetails>(LoginEvent);
  }
  Future<void> LoginEvent(
      LoginDetails event,
      Emitter<LoginState> emit,
      ) async {
    try {
      emit(LoginLoaded());
      bool result = await InternetConnectionChecker().hasConnection;
      if (result) {
        Response loadedResponse = await _apiRepository.loginload(
            event.context,
            event.email,
            event.password
        );
        var unloadData = _decoder.convert(loadedResponse.body);
        print(unloadData.toString());
        if(loadedResponse.statusCode == 200){
          print('successsss');
        }
      }
    } catch (e) {
      showLoading = 0;
      emit(LoginError(message: e.toString()));
    }
  }

}


