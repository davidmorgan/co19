/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if a class declares a static getter named
 * v and also has a non-static setter named v =.
 * @description Checks that a compile error is arisen if a class has an
 * implicitly declared static getter and an explicitly declared instance
 * setter with the same name.
 * @compile-error
 * @issue 24534
 * @author ngl@unipro.ru
 */

class C {
  static int v;
  set v(int v1) {
  }
}

main() {
  C.v;
}
