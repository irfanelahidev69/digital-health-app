part of 'signup_bloc.dart';


abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignupSuccessState extends SignupState{

}
class SignupFailureState extends SignupState{
  final String? message;
  final int? errorCode;
  SignupFailureState({this.message, this.errorCode});
}
class SignupLoadingState extends SignupState{}
class SignupNoInternetState extends SignupState{}
