// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting factory constructor q′ is redirection-reachable
/// from a redirecting factory constructor q iff q′ is the redirectee
/// constructor of q, or q′′ is the redirectee constructor of q and q′ is
/// redirection-reachable from q′′. It is a compile-time error if a redirecting
/// factory constructor is redirection-reachable from itself.
///
/// @description Checks that a compile-error occurs when a factory constructor
/// redirects to itself through a cycle.
/// @author sgrekhov@unipro.ru

class C {
  factory C = C.f1;
//            ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory C.f1() = C.f2;
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  factory C.f2() = CAlias;
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

typedef CAlias = C;

main() {
  print(C);
}
