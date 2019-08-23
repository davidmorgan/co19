/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is not an error for the body of a late field to reference this.
 *
 * @description Check that it is not an error for the body of a late field to
 * reference this.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class A {
  String s;
  A(this.s);
}

class C {
  A a = new A("Lily was here");
  covariant late A a1 = this.a;
  late covariant A a2 = this.a;
  late covariant final A a3 = this.a;
  covariant late final A a4 = this.a;
}

main() {
  Expect.equals("Lily was here", new C().a1);
  Expect.equals("Lily was here", new C().a2);
  Expect.equals("Lily was here", new C().a3);
  Expect.equals("Lily was here", new C().a4);
}
