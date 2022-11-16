part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginDetails extends LoginEvent{
  final BuildContext context;
  final String email,
      password;


  const LoginDetails({
    required this.context,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [];

}