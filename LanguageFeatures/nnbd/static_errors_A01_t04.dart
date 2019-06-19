/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call a method, setter, getter or operator on
 * an expression whose type is potentially nullable and not dynamic, except for
 * the methods, setters, getters, and operators on Object.
 * @description Check that it is a compile-time error to call a method, setter,
 * getter or operator on an expression whose type is potentially nullable. Test
 * dynamic
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

class C {
  String m = "";
  void foo() {}
  int get g => 1;
  void set s(int i) {}
}

test(x) {
  x.m;             //# 01: compile-time error
  x.foo();         //# 02: compile-time error
  x.g;             //# 03: compile-time error
  x.s = 2;         //# 04: compile-time error
}

main() {
  test(new C());
}
