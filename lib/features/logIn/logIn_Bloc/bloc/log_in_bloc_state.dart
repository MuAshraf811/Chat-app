part of 'log_in_bloc_bloc.dart';

@immutable
abstract class LogInBlocState {}

class LogInBlocInitial extends LogInBlocState {}

class SuccessLoged extends LogInBlocState {}

class NoUserFound extends LogInBlocState {}

class ErrorLoged extends LogInBlocState {
  final String error;

  ErrorLoged({required this.error});
}

class WrongPassword extends LogInBlocState {}
