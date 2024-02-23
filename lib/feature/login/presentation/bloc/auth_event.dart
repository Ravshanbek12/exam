part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  final FirebaseAuth auth;
  final String email;
  final String password;

  AuthEvent({required this.auth, required this.email, required this.password});
}
