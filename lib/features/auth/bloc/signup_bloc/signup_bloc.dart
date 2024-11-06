import 'package:bloc/bloc.dart';
import 'package:digital_health_app/core/firebase/firestore_handler.dart';
import 'package:digital_health_app/core/model/firestore_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/model/user.dart';
import '../../../../core/network/network_connection.dart';
import '../../../../core/utilities/strings.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FireStoreHandler fireStoreHandler = FireStoreHandler();
    on<UserSignupEvent>((event, emit) async {
      emit(SignupLoadingState());
      try {
        bool isConnection = await NetworkConnection().checkConnection();
        if (!isConnection) {
          emit(SignupNoInternetState());
          return;
        }
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: event.email, password: event.password);
        if (userCredential.user != null) {
          UserModel user = UserModel(email: event.email, name: event.name, id: userCredential.user!.uid);

          FireStoreResponse fireStoreResponse = await fireStoreHandler.addDocument(collectionName: FireStoreHandler.USER, data: user.toMap(), message: "User added successfully.");
          if (fireStoreResponse.success) {
            emit(SignupSuccessState());
          } else {
            await auth.currentUser!.delete();
            emit(SignupFailureState(message: fireStoreResponse.message));
          }
        } else {
          emit(SignupFailureState(message: "Something went wrong"));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(SignupFailureState(message: Strings.thePasswordProvidedIsTooWeak));
        } else if (e.code == 'email-already-in-use') {
          emit(SignupFailureState(message: Strings.theAccountAlreadyExistsForThatEmail));
        }
      } catch (e) {
        emit(SignupFailureState(message: Strings.somethingWentWrong));
      }
    });
  }
}
