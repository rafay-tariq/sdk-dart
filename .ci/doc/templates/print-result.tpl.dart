import 'dart:io';

import 'package:kuzzle/kuzzle.dart';

void main() async {
  final kuzzle = Kuzzle(
    WebSocketProtocol('kuzzle'),
    offlineMode: OfflineMode.auto,
  );
  kuzzle.connect();
  [snippet-code]
  print(result.toString());
  kuzzle.disconnect();
  exit(0);
}