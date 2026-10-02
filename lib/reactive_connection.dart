
import 'dart:async';

enum ConnectionStatus {
  pending,
  connecting,
  connected,
  disconnected,
}
class ReactiveConnection {
  final StreamController<ConnectionStatus> _statusController = StreamController<ConnectionStatus>.broadcast();

  Stream<ConnectionStatus> get statusStream => _statusController.stream;

  ConnectionStatus _status = ConnectionStatus.pending;

  ConnectionStatus get status => _status;

  set status(ConnectionStatus newStatus) {
    if (_status != newStatus) {
      _status = newStatus;
      _statusController.add(newStatus);
    }
  }

  void updateStatus(ConnectionStatus newStatus) {
    status = newStatus;
  }

}
