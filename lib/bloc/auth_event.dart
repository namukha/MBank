part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SigningIn extends AuthEvent {
  final String email;
  final String password;

  SigningIn(this.email, this.password);
}

class SigningUp extends AuthEvent {
  final String email;
  final String password;

  SigningUp(this.email, this.password);
}

class SigningOut extends AuthEvent {}