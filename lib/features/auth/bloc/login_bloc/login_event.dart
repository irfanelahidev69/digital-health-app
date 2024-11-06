part of 'login_bloc.dart';


abstract class LoginEvent {}

class UserLoginEvent extends LoginEvent {
  final String email;
  final String password;
  UserLoginEvent({required this.email, required this.password});
}

class UserLogoutEvent extends LoginEvent {}


class UserCheckedEvent extends LoginEvent{}
