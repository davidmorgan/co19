// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
///
/// @description Check that if type T0 is a record with another shape than T1
/// then T0 is not a subtype of T1
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 not a subtype of a type T1, then instance
/// of T0 cannot be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from records_fail_A02.dart and 
/// return_value_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

// SharedOptions=--enable-experiment=records

(int, String) t0Instance = (1, "2");
(int, String, bool) t1Instance = (3, "4", false);

const t1Default = const (5, "6", false);



(int, String, bool) returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static (int, String, bool) staticTestMethod() => forgetType(t0Instance);

  (int, String, bool) testMethod() => forgetType(t0Instance);

  (int, String, bool) get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  (int, String, bool) returnValueLocalFunc() => forgetType(t0Instance);

  Expect.throws(() {
    returnValueFunc();
  }, (e) => e is TypeError);
  Expect.throws(() {
    returnValueLocalFunc();
  }, (e) => e is TypeError);
  Expect.throws(() {
    ReturnValueTest.staticTestMethod();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ReturnValueTest().testMethod();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ReturnValueTest().testGetter;
  }, (e) => e is TypeError);

  // Test type parameters

  //# <-- NotGenericFunctionType
  Expect.throws(() {
    new ReturnValueGen<(int, String, bool)>().testMethod();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ReturnValueGen<(int, String, bool)>().testGetter;
  }, (e) => e is TypeError);
  //# -->
}
