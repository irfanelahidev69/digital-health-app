import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/model/user.dart';
import '../../../../core/network/network_connection.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    FirebaseAuth auth = FirebaseAuth.instance;
    on<UserLoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      try {
        bool isConnection = await NetworkConnection().checkConnection();
        if (!isConnection) {
          emit(NoInternetState());
          return;
        }
        UserCredential userCredential = await auth.signInWithEmailAndPassword(email: event.email, password: event.password);

        if (userCredential.user != null) {
          emit(LoginSuccessState());
        } else {
          emit(LoginFailedState(message: "Something went wrong"));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(LoginFailedState(message: "No user found for that email"));
        } else if (e.code == 'invalid-credential') {
          emit(LoginFailedState(message: "Invalid Credentials"));
        } else if (e.code == 'wrong-password') {
          emit(LoginFailedState(message: "Email or password is incorrect"));
        }
      } catch (e) {
        emit(LoginFailedState(message: "Something went wrong"));
      }
    });
  }
}
