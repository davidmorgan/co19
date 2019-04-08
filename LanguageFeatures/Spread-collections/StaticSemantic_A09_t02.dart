/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A non-null-aware spread element has static type Null.
 * @description Checks that compile error is thrown if spread element is
 * statically [Null].
 * @description Check that trying to use [null] element as a non-null-aware
 * spread element in constant causes compile error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

main() {
  const res1 = [...null];           //# 01: compile-time error
  const Map res2 = {...null};       //# 02: compile-time error
  const Set res3 = {...null};       //# 03: compile-time error

  const res4 = <int>[...null];      //# 04: compile-time error
  const res5 = <int>{...null};      //# 05: compile-time error
  const res6 = <int, int>{...null}; //# 06: compile-time error

  const res7 = [...?null];
  const Map res8 = {...?null};
  const Set res9 = {...?null};

  const res10 = <int>[...?null];
  const res11 = <int>{...?null};
  const res12 = <int, int>{...?null};
}