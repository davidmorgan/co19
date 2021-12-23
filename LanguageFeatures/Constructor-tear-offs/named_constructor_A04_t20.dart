// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Similarly, [params] is almost exactly the same parameter list
/// as the constructor [C.name], with the one exception that initializing
/// formals are represented by normal parameters with the same name and type.
/// All remaining properties of the parameters are the same as for the
/// corresponding constructor parameter, including any default values, and
/// [args] is an argument list passing those parameters to [C.name] directly as
/// they are received.
///
/// @description Checks that initializing formals are represented by normal
/// parameters with the same name and type - test required named parameter.
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  int i = 0;
  C.constr({required this.i});
}

dynamic d = 1.1;

main() {
  var v = C.constr;
  Expect.isTrue(v is C Function({ required int i }));
  Expect.runtimeIsType<C Function({ required int i })>(v);

  C c1 = v(i: 1);
  Expect.equals(1, c1.i);

  Expect.throws(() { v(i: d); });
  Expect.throws(() { v(i: "Lily was here" as dynamic); });
}
