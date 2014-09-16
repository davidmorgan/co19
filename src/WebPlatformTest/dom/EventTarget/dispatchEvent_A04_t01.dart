/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/dom/events/EventTarget-dispatchEvent.html
 *
 * @description Event listeners should be called in order of addition
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var results = [];
  var b = document.createElement("b");

  b.addEventListener("x", (e) {
    asyncEnd();
    results.add(1);
  }, true);
  b.addEventListener("x", (e) {
    asyncEnd();
    results.add(2);
  }, false);
  b.addEventListener("x", (e) {
    asyncEnd();
    results.add(3);
  }, true);

  asyncMultiStart(3);
  b.dispatchEvent(new Event("x"));
  Expect.listEquals(results, [1, 2, 3]);
}
