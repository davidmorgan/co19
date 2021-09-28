// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of instantiated local generic functions
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

typedef X Foo<X>(X x);

Foo getFoo() {
  X localFunction<X>(X x) => x;
  return localFunction;
}

Foo<int> getIntFoo() {
  X localFunction<X>(X x) => x;
  return localFunction<int>;
}

var g1 = getFoo();
var g2 = getFoo();
var ig1 = getIntFoo();
var ig2 = getIntFoo();

main() {
  Expect.notEquals(g1, g2);
  Expect.notEquals(ig1, ig2);
  Expect.notEquals(ig1, g1);
}
