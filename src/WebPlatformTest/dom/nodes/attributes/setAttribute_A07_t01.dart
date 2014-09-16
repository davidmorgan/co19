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
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattribute">
 * 
 * @description setAttribute should set the attribute with the given qualified name
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
  // Based on a test by David Flanagan.
  var el = document.createElement("baz");
  el.setAttributeNS("foo", "foo:bar", "1");
  assert_equals(el.getAttribute("foo:bar"), "1");
  el.setAttribute("foo:bar", "2");
  assert_equals(el.getAttribute("foo:bar"), "2");
}
