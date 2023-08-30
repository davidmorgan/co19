// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an expression is required to be a
/// constant expression but its evaluation would raise an exception.
/// @description Checks that an Exception raised during evaluation of
/// a compile-time constant causes a compile-time error.
/// @author iefremov


const m = 1 ~/ 0;
//        ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(m);
}
