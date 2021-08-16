// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a constructor tear-off denotes a
/// generative constructor declared in an abstract class.
///
/// @description Checks that it is no error to tear off a factory
/// constructor declared in an abstract class
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs
import "../../Utils/expect.dart";

abstract class A<T> {
  A.g() {}

  factory A() {
    return new C<T>();
  }
}

class C<T> extends A<T> {
  C() : super.g() {}
}

main() {
  var c = A<int>.new;
  var x = c();
  Expect.isTrue(x is C<int>);
  Expect.isFalse(x is A<String>); // to check that x is not C<dynamic>
}