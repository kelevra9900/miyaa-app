// ignore_for_file: library_prefixes

import 'dart:developer';

import 'package:miyaa/common/secure_storage.dart';
import 'package:miyaa/tools/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketManager {
  static final SocketManager _instance = SocketManager._internal();
  late IO.Socket _socket;
  String _token = '';

  factory SocketManager() {
    return _instance;
  }

  SocketManager._internal();

  void initSocket() async {
    _token = await secureStorage.jwt ?? "";

    _socket = IO.io(
      constants.domain,
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .setAuth({
            'token': _token,
          })
          .build(),
    );
  }

  void connect() {
    _socket.connect();
    log('Connected to Socket.IO server');
  }

  void disconnect() {
    _socket.disconnect();
  }

  void off(String event) {
    _socket.off(event);
  }

  void emit(String event, [dynamic data]) {
    _socket.emit(event, data);
  }

  void on(String event, Function(dynamic) callback) {
    _socket.on(event, callback);
  }

  // Evaluate if the socket is connected
  bool get isConnected => _socket.connected;

  // Evaluate if the socket is disconnected
  bool get isDisconnected => _socket.disconnected;
}
