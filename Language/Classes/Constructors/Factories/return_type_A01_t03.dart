// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a factory whose signature is of the form
/// factory M or the form factory M.id is M if M is not a generic type;
/// otherwise the return type is M<T1, . . . , Tn> where T1, . . . , Tn are the
/// type parameters of the enclosing class.
///
/// @description Checks that a compile error is produced when assigning the
/// result of invoking the factory constructor `M.id` to a variable `v` with
/// declared type `T` such that `M` is not assignable to `T`.
/// @author iefremov

class A {
  factory A.bcd() = C;
}

class C implements A {
}

enum E {
  e1, e2;
  const E();
  factory E.n() => E.e1;
}

main() {
  int a = A.bcd();
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int b = E.n();
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
