// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When [value] is longer accessible to the program, while still
/// having an attachement to this finalizer, the [callback] of this finalizer
/// may be called with [finalizationToken] as argument.
///
/// @description Checks that callback function can be called only once when
/// given object is inaccessible.
/// @author iarkh@unipro.ru

import "../gc_utils_lib.dart";
import "../../../Utils/expect.dart";

int called = 0;
final Finalizer finalizer = Finalizer((_) {
  called++;
});

void test(Object o) {
  triggerGc();
}

Object test1(Object obj) => obj;

main() async {
  Object value = Object();
  finalizer.attach(value, "Finalization token");

  value = 12345;

  // Initial object is not accessible anymore.
  // Do something, call triggerGC several times and check that callback was
  // called only once during the execution.
  test(value);
  await triggerGcWithDelay();

  var value1 = test1(value);
  await triggerGcWithDelay();
  triggerGc();
  await triggerGcWithDelay();
  triggerGc();
  triggerGc();
  await triggerGcWithDelay();

  Expect.equals(1, called);
}
