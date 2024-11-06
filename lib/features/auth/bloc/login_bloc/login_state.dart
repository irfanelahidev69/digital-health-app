part of 'login_bloc.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState{}

class LoginLoadingUserState extends LoginState{}

class LoginSuccessState extends LoginState{}


class LoginFailedState extends LoginState{
  final String? message;
  final int? errorCode;
  LoginFailedState({this.errorCode, this.message});
}

class LoginGetUserState extends LoginState{
  final UserModel user;
  LoginGetUserState({required this.user});
}

class NoInternetState extends LoginState{}

class IsUserLoggedState extends LoginState{
  bool isUserLogged;
  IsUserLoggedState({required this.isUserLogged});
}
