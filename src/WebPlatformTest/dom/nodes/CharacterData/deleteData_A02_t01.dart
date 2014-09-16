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
/*
 * after web-platform-tests/dom/nodes/CharacterData-appendData.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-characterdata-deletedata">
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-characterdata-data">
 * 
 * @description 
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void check(CharacterData node) {
  node.data = "test";
  assert_equals(node.data, "test");
  node.deleteData(1, 1);
  assert_equals(node.data, "tst");
}

void main() {
  check(new Text("test"));
  check(new Comment("test"));
}
