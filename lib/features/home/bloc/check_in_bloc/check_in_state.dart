part of 'check_in_bloc.dart';

@immutable
sealed class CheckInState {}

final class CheckInInitial extends CheckInState {}

final class CheckInLoading extends CheckInState {}


final class CheckInSuccessful extends CheckInState {}

final class CheckInUnsuccessful extends CheckInState {}

final class NoInternet extends CheckInState {

}