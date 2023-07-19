part of 'connection_bloc.dart';

@immutable
abstract class ConnectionState {}
class ConnectionInitial extends ConnectionState {}
class WifiConnection extends ConnectionState {}
class DataConnection extends ConnectionState {}
class NoConnection extends ConnectionState {}
