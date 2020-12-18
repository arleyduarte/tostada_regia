part of 'login_bloc.dart';

@immutable


abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}


class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
    @required this.username,
    @required this.password,
  });



  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}

class LoginSubmitted extends LoginEvent {}

