part of 'check_in_bloc.dart';

@immutable
sealed class CheckInEvent {}

final class UserCheckInEvent extends CheckInEvent {
  final String note;

  UserCheckInEvent({
    required this.note,
  });
}
