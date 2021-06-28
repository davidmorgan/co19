// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Evaluation of an assignment a of the form e1?.v = e2 is ...
/// The static type of a is the static type of e2
/// @description Checks that the static type of e1?.v = e2 is the static type
/// of e2
/// @author sgrekhov@unipro.ru

import '../../../Utils/expect.dart';

class C {
  var v;
}

main() {
  double e = 3.14;
  C c = new C();
  double x = c?.v = e;
  Expect.equals(3.14, x);

  c = null;
  x = c?.v = e;
  Expect.isNull(x);
}
