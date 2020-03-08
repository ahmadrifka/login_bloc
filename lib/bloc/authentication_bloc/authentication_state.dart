import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}
// if the authentication state was uninitialized, the user might be seeing a splash screen
class Unintialized extends AuthenticationState {}

// if the authentication state was authenticated, the user might see a home screen.
class Aunthenticated extends AuthenticationState {
  final String displayName;

  Aunthenticated(this.displayName);
  
  @override
  List<Object> get props => [displayName];

   @override
  String toString() => 'Authenticated { displayName: $displayName }';

}
// if the authentication state was unauthenticated, the user might see a login form.
class Unauthenticated extends AuthenticationState {}