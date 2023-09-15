// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The current instance (and hence its members) can only be accessed at
/// specific locations in a class: We say that a location ℓ has access to this
/// iff ℓ is inside the body of a declaration of an instance member or a
/// generative constructor, or in the initializing expression of a late instance
/// variable declaration.
///
/// Note that an initializing expression for a non-late instance variable does
/// not have access to this, and neither does any part of a declaration marked
/// static.
///
/// @description Checks that it is a compile-time error if `this` is accessed in
/// an initializing expression of a non-late instance variable
/// @author sgrekhov22@gmail.com

class C {
  int x = 0;
  void Function() y1 = () {print(this.x);};
//                               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int Function() y2 = () => this.x;
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int Function(String s) y3 = (String s) {return this.x;};
//                                               ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}


main() {
  print(C);
}
