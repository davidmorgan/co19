// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Null: if T0 is Null then:
/// - if T1 is a type variable (promoted or not) the query is false
/// - If T1 is FutureOr<S> for some S, then the query is true iff Null <: S.
/// - If T1 is Null, S? or S* for some S, then the query is true.
/// - Otherwise, the query is false
/// @description Check that if type T0 is Null and T1 is FutureOr<S> for some S,
/// and Null is subtype of S then T0 is subtype of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the class member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from left_null_A03.dart and 
/// class_member_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



import "dart:async";

Null t0Instance = null;
FutureOr<Object?> t1Instance = null;

const t1Default = const Object();




class ClassMember1_t01 {
  static FutureOr<Object?> s = t0Instance;
  FutureOr<Object?> m = t0Instance;
  FutureOr<Object?> _p = t0Instance;

  ClassMember1_t01() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  ClassMember1_t01.named(FutureOr<Object?> value) {
    s = value;
    m = value;
    _p = value;
  }

  ClassMember1_t01.short(this.m, this._p);

  test() {
    s = t0Instance;
    m = t0Instance;
    _p = t0Instance;
  }

  set setter(FutureOr<Object?> val) {
    _p = val;
  }

  FutureOr<Object?> get getter => _p;

  static staticTest() {
    s = t0Instance;
  }

  static set staticSetter(FutureOr<Object?> val) {
    s = val;
  }

  static FutureOr<Object?> get staticGetter => t0Instance;
}

main() {
  ClassMember1_t01 c1 = new ClassMember1_t01();
  c1 = new ClassMember1_t01.short(t0Instance,
      t0Instance);
  c1 = new ClassMember1_t01.named(t0Instance);
  c1.m = t0Instance;
  c1.test();
  c1.setter = t0Instance;
  c1.getter;

  ClassMember1_t01.s = t0Instance;
  ClassMember1_t01.staticTest();
  ClassMember1_t01.staticSetter = t0Instance;
  ClassMember1_t01.staticGetter;
}
