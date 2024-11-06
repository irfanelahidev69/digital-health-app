part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}
