import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUninitialized()) {
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationAuthenticated());
  }

  void _onLoggedOut(LoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await FirebaseAuth.instance.signOut();
    emit(AuthenticationUnauthenticated());
  }
}
