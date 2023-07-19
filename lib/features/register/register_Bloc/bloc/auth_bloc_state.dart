part of 'auth_bloc_bloc.dart';

@immutable
abstract class AuthBlocState {}

class AuthBlocInitial extends AuthBlocState {}
class SuccessAuth extends AuthBlocState {}
class VreifingAuth extends AuthBlocState {}
class WeakPasswordError extends AuthBlocState {}
class AlreadyExistError extends AuthBlocState {}

class ErrorWhileAuth extends AuthBlocState {
  final String error;

  ErrorWhileAuth({required this.error});
}
