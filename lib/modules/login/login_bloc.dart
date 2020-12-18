import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tostada_regia/models/session_manager.dart';
import 'package:tostada_regia/network/rest_data_source.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // TODO: implement mapEventToState

    print(event);



    if (event is LoginButtonPressed) {

      yield Authenticating();
      var  username = "arleymauricio@gmail.com";
      var  sPassword = "123456789";
      RestDataSource restDataSource = new RestDataSource();
      final session = await restDataSource.authenticate(
        username: username,
        password: sPassword,
      );


      SessionManager.instance.saveAccessToken(session);



      yield LoginSuccessfully();
    }

  }
}
