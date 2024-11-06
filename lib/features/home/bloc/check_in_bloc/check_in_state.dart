part of 'check_in_bloc.dart';

@immutable
sealed class CheckInState {}

final class CheckInInitial extends CheckInState {}

final class CheckInLoading extends CheckInState {}

final class CheckInSuccessful extends CheckInState {}

final class CheckInUnsuccessful extends CheckInState {
  final String message;

  CheckInUnsuccessful({required this.message});
}

final class NoInternet extends CheckInState {}

final class CheckInHistory extends CheckInState {
  final List<CheckInModel> checkInList;

  CheckInHistory({required this.checkInList});
}
