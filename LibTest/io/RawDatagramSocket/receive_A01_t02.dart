/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Datagram receive()
 * Receive a datagram. If there are no datagrams available null is returned.
 *
 * @description Checks that RawSocketEvent.closed event does not have datagram
 * and method receive returns null in this case.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../http_utils.dart";
import "../../../Utils/expect.dart";

var localhost = InternetAddress.loopbackIPv4;

main() async {
  RawDatagramSocket producer = await RawDatagramSocket.bind(localhost, 0);
  RawDatagramSocket receiver = await RawDatagramSocket.bind(localhost, 0);
  List<List<int>> toSend = [];
  List<int> bytesSent =
      await sendDatagramOnce(producer, toSend, localhost, receiver.port);
  producer.close();

  List<List<int>> received =
      await receiveDatagram(receiver, event: RawSocketEvent.closed);
  if (bytesSent.isNotEmpty) {
    Expect.equals(1, received.length);
    Expect.equals(received[0], null);
  }
}
