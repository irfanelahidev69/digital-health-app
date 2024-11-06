import 'package:bloc/bloc.dart';
import 'package:digital_health_app/core/firebase/firestore_handler.dart';
import 'package:digital_health_app/core/model/check_in.dart';
import 'package:digital_health_app/core/model/firestore_response.dart';
import 'package:digital_health_app/core/network/network_connection.dart';
import 'package:meta/meta.dart';

part 'check_in_event.dart';
part 'check_in_state.dart';

class CheckInBloc extends Bloc<CheckInEvent, CheckInState> {
  FireStoreHandler fireStoreHandler = FireStoreHandler();

  CheckInBloc() : super(CheckInInitial()) {
    on<UserCheckInEvent>((event, emit) async {
      try {
        emit(CheckInLoading());
        bool isConnection = await NetworkConnection().checkConnection();
        if (!isConnection) {
          emit(NoInternet());
          return;
        }
        FireStoreResponse response = await fireStoreHandler.addDocument(collectionName: '', data: event.checkIn.toMap(), message: "Check In Successful");
        if (response.success) {
          emit(CheckInSuccessful());
        } else {
          emit(CheckInUnsuccessful());
        }
      } catch (e) {
        emit(CheckInUnsuccessful());
      }
    });
  }
}
