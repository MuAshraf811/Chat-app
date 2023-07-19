import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  StreamSubscription? sub;
  ConnectionBloc() : super(ConnectionInitial()) {
    on<ConnectedWifi>((event, emit) {
      emit(WifiConnection());
    });
     on<ConnectedData>((event, emit) {
      emit(DataConnection());
    });
     on<NotConnected>((event, emit) {
      emit(NoConnection());
    });

    sub = Connectivity().onConnectivityChanged.listen((ConnectivityResult res) {
      if (res == ConnectivityResult.wifi) {
        add(ConnectedWifi());
      } else if (res == ConnectivityResult.mobile) {
        add(ConnectedData());
      } else if (res == ConnectivityResult.none) {
        add(NotConnected());
      }
    });
  }
}
