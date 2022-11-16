part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoaded extends LoginState {
  LoginLoaded();
}

class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});
}