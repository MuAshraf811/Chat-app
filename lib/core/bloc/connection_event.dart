part of 'connection_bloc.dart';

@immutable
abstract class ConnectionEvent {}
class CheckConnectionEvent extends ConnectionEvent{}
class ConnectedWifi extends ConnectionEvent{}
class ConnectedData extends ConnectionEvent{}
class NotConnected extends ConnectionEvent{}