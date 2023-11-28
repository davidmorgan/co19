// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a factory whose signature is of the form
/// factory M or the form factory M.id is M if M is not a generic type;
/// otherwise the return type is M<T1, . . . , Tn> where T1, . . . , Tn are the
/// type parameters of the enclosing class.
///
/// @description Checks that returning an object whose type is not subtype of
/// `M` from a factory constructor `M` produces a compile error. Test type alias
/// @author sgrekhov@unipro.ru

class C {}
typedef CAlias = C;

class A extends C {
  factory A() => CAlias();
//               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E implements C {
  e1.g(), e2.g();
  const E.g();
  factory E() => CAlias();
//               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(A);
  print(E);
}
