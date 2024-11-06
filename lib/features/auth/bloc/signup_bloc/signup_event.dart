part of 'signup_bloc.dart';


abstract class SignupEvent {}

class UserSignupEvent extends SignupEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;


  UserSignupEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}
