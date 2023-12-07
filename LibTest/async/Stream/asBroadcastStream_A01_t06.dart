// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream<T> asBroadcastStream (
///   {void onListen(StreamSubscription<T> subscription),
///    void onCancel(StreamSubscription<T> subscription)})
/// Returns a multi-subscription stream that produces the same events as this.
///
/// The returned stream will subscribe to this stream when its first subscriber
/// is added, and will stay subscribed until this stream ends, or a callback
/// cancels the subscription.
///
/// @description Checks that the returned stream will unsubscribe from
/// this stream when onListen callback cancels the subscription.
///
/// @author a.semenov@unipro.ru

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  bool hasListener = false;
  bool listenerCancelled = false;
  StreamController controller = new StreamController(onListen: () {
    hasListener = true;
  }, onCancel: () {
    listenerCancelled = true;
  });
  Stream b = controller.stream.asBroadcastStream(
      onListen: (StreamSubscription subscription) {
    subscription.cancel();
  });
  Expect.isFalse(hasListener);
  Expect.isFalse(listenerCancelled);

  b.listen(null);
  Expect.isTrue(hasListener);
  Expect.isTrue(listenerCancelled);
  controller.add("a");
  controller.add("b");
  controller.close();
}
