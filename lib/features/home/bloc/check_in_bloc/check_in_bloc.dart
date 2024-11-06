import 'package:bloc/bloc.dart';
import 'package:digital_health_app/core/firebase/firestore_handler.dart';
import 'package:digital_health_app/core/model/check_in.dart';
import 'package:digital_health_app/core/model/firestore_response.dart';
import 'package:digital_health_app/core/network/network_connection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../../core/utilities/strings.dart';

part 'check_in_event.dart';

part 'check_in_state.dart';

class CheckInBloc extends Bloc<CheckInEvent, CheckInState> {
  FireStoreHandler fireStoreHandler = FireStoreHandler();
  FirebaseAuth auth = FirebaseAuth.instance;

  CheckInBloc() : super(CheckInInitial()) {
    on<UserCheckInEvent>((event, emit) async {
      try {
        emit(CheckInLoading());
        bool isConnection = await NetworkConnection().checkConnection();
        if (!isConnection) {
          emit(NoInternet());
          return;
        }

        CheckInModel checkIn = CheckInModel(
          userId: auth.currentUser!.uid,
          note: event.note,
          checkInTime: DateTime.now().toUtc(),
        );

        FireStoreResponse response = await fireStoreHandler.addDocument(collectionName: FireStoreHandler.CHECK_IN, data: checkIn.toMap(), message: "Check In Successful");
        if (response.success) {
          emit(CheckInSuccessful());
        } else {
          emit(CheckInUnsuccessful(message: response.message));
        }
      } catch (e) {
        emit(CheckInUnsuccessful(message: Strings.somethingWentWrong));
      }
    });
    on<GetCheckInHistoryEvent>((event, emit) async {
      try {
        emit(CheckInLoading());
        bool isConnection = await NetworkConnection().checkConnection();
        if (!isConnection) {
          emit(NoInternet());
          return;
        }
        FireStoreResponse response = await fireStoreHandler.getDocumentWhere(collectionName: FireStoreHandler.CHECK_IN, query: auth.currentUser!.uid, field: FireStoreHandler.USER_id);

        if (response.success) {
          List<CheckInModel> checkInList = List<CheckInModel>.generate(
            response.data!.length,
            (index) => CheckInModel.fromJson(response.data![index].data()),
          );

          emit(CheckInHistory(checkInList: checkInList));
        } else {
          emit(CheckInUnsuccessful(message: response.message));
        }
      } catch (e) {
        emit(CheckInUnsuccessful(message: Strings.somethingWentWrong));
      }
    });
  }
}
