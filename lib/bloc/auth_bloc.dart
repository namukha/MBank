import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/repositories/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super (UnAuthenticated()) {
    on<SigningIn>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signIn(email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SigningUp>((event, emit) async{
      emit(Loading());
      try {
        await authRepository.signUp(email: event.email, password: event.password);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    on<SigningOut>((event, emit) async{
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
