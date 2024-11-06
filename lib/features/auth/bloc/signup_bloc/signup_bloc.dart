import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/utilities/strings.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    FirebaseAuth auth = FirebaseAuth.instance;
    on<UserSignupEvent>((event, emit) async {
      emit(SignupLoadingState());
      try {
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: event.email, password: event.password);
        if (userCredential.user != null) {
          userCredential.user!.updateDisplayName(event.name);
          emit(SignupSuccessState());
        } else {
          emit(SignupFailureState(message: "Something went wrong"));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(SignupFailureState(message: 'The password provided is too weak'));
        } else if (e.code == 'email-already-in-use') {
          emit(SignupFailureState(message: 'The account already exists for that email'));
        }
      } catch (e) {
        emit(SignupFailureState(message: Strings.somethingWentWrong));
      }
    });
  }
}
