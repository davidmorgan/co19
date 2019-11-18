/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 *
 * @description Check that if opted-in class implements two classes with some
 * method (the first class is legacy and method in the second has argument of
 * nullable type), opted-in method argument can be of nullable type and the
 * method can accept null as its argument.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "dart:async";
import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

abstract class B {
  void test_int(int? i);
  void test_object(Object? i);
  void test_dynamic(dynamic i);
  void test_function(Function? i);
  void test_futureOr(FutureOr? i);
  void test_null(Null i);
}

class A implements B, LEGACY_ARGS {
  void test_int(int? i) {
    Expect.isNull(i);
  }

  void test_object(Object? i) {
    Expect.isNull(i);
  }

  void test_dynamic(dynamic i) {
    Expect.isNull(i);
  }

  void test_function(Function? i) {
    Expect.isNull(i);
  }

  void test_futureOr(FutureOr? i) {
    Expect.isNull(i);
  }

  void test_null(Null i) {
    Expect.isNull(i);
  }
}

main() {
  A a = A();

  a.test_int(null);
  a.test_object(null);
  a.test_dynamic(null);
  a.test_function(null);
  a.test_futureOr(null);
}
