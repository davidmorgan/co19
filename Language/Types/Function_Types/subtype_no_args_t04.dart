// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function type (T1,...Tk,[Tk+1,...,Tn+m]) -> T is a subtype of
/// the function type (S1,...,Sk+j,[Sk+j+1,...,Sn]) -> S, if all of the following
/// conditions are met:
/// 1. Either
///    • S is void, or
///    • T <=> S.
/// 2. ∀i ∈ 1..n, Ti ⇐⇒ Si.
/// @description Checks that this statement is true for function types with no
/// arguments: S is some generic, T is some other type assignable to S.
/// @author iefremov

import "../../../Utils/expect.dart";

typedef t1();
typedef void t2();
typedef int? t3();
typedef String? t4();
typedef double? t5();
typedef Object? t6();
typedef t1? t7();
typedef List? t8();
typedef List<int>? t9();
typedef Map<int, List<List<List>>>? t10();
typedef t10? t11();
typedef t11? t12();
typedef num? t13();
typedef List<B>? t14();
typedef Map? t15();
typedef Map<num, Object>? t16();

class A {}
class B extends A {}
class C extends B {}
class D extends C {}

  //() -> T is () -> List
List? f1() {}
List<int>? f2() {}
List<double>? f3() {}
List<Object>? f4() {}
List<String>? f5() {}
List<Map<int, Map>>? f6() {}
List<Map<int, t8>>? f7() {}
List<Map<t8, t8>>? f8() {}
List<t8>? f9() {}
  //() -> T is () -> List<int>
List? f10() {}
List<int>? f11() {}
List<Object>? f12() {}
  //() -> T is () -> List<B>
List? f13() {}
List<Object>? f14() {}
List<A>? f15() {}
List<B>? f16() {}
List<C>? f17() {}
List<D>? f18() {}
  //() -> T is () -> Map
Map? f19() {}
Map<Object, Object>? f20() {}
Map<Object, int>? f21() {}
Map<int, Object>? f22() {}
Map<int, int>? f23() {}
Map<int, List<int>>? f24() {}
Map<List<int>, List<int>>? f25() {}
Map<List<int>, t15>? f26() {}
Map<t15, t15>? f27() {}
Map<t15, t14>? f28() {}
  //() -> T is () -> Map<num, Object>
Map<num, Object>? f29() {}
Map<int, Object>? f30() {}
Map<double, Object>? f31() {}
Map<double, int>? f32() {}
Map<double, num>? f33() {}
Map<int, A>? f34() {}
Map<num, B>? f35() {}
Map<num, List>? f36() {}
Map<num, Map>? f37() {}
Map<num, Map<int, int>>? f38() {}
Map<num, Map<List, List<int>>>? f39() {}

main() {
  //() -> T is () -> List
  Expect.isTrue(f1 is t8);
  Expect.isTrue(f2 is t8);
  Expect.isTrue(f3 is t8);
  Expect.isTrue(f4 is t8);
  Expect.isTrue(f5 is t8);
  Expect.isTrue(f6 is t8);
  Expect.isTrue(f7 is t8);
  Expect.isTrue(f8 is t8);
  Expect.isTrue(f9 is t8);
  checkType(checkIs<t8>, true, f1);
  checkType(checkIs<t8>, true, f2);
  checkType(checkIs<t8>, true, f3);
  checkType(checkIs<t8>, true, f4);
  checkType(checkIs<t8>, true, f5);
  checkType(checkIs<t8>, true, f6);
  checkType(checkIs<t8>, true, f7);
  checkType(checkIs<t8>, true, f8);
  checkType(checkIs<t8>, true, f9);

  //() -> T is () -> List<int>
  Expect.isFalse(f10 is t9);
  Expect.isTrue(f11 is t9);
  Expect.isFalse(f12 is t9);
  checkType(checkIs<t9>, false, f10);
  checkType(checkIs<t9>, true, f11);
  checkType(checkIs<t9>, false, f12);

  //() -> T is () -> List<B>
  Expect.isFalse(f13 is t14);
  Expect.isFalse(f14 is t14);
  Expect.isFalse(f15 is t14);
  Expect.isTrue(f16 is t14);
  Expect.isTrue(f17 is t14);
  Expect.isTrue(f18 is t14);
  checkType(checkIs<t14>, false, f13);
  checkType(checkIs<t14>, false, f14);
  checkType(checkIs<t14>, false, f15);
  checkType(checkIs<t14>, true, f16);
  checkType(checkIs<t14>, true, f17);
  checkType(checkIs<t14>, true, f18);

  //() -> T is () -> Map
  Expect.isTrue(f19 is t15);
  Expect.isTrue(f20 is t15);
  Expect.isTrue(f21 is t15);
  Expect.isTrue(f22 is t15);
  Expect.isTrue(f23 is t15);
  Expect.isTrue(f24 is t15);
  Expect.isTrue(f25 is t15);
  Expect.isTrue(f26 is t15);
  Expect.isTrue(f27 is t15);
  Expect.isTrue(f28 is t15);
  checkType(checkIs<t15>, true, f19);
  checkType(checkIs<t15>, true, f20);
  checkType(checkIs<t15>, true, f21);
  checkType(checkIs<t15>, true, f22);
  checkType(checkIs<t15>, true, f23);
  checkType(checkIs<t15>, true, f24);
  checkType(checkIs<t15>, true, f25);
  checkType(checkIs<t15>, true, f26);
  checkType(checkIs<t15>, true, f27);
  checkType(checkIs<t15>, true, f28);

  //() -> T is () -> Map<num, Object>
  Expect.isTrue(f29 is t16);
  Expect.isTrue(f30 is t16);
  Expect.isTrue(f31 is t16);
  Expect.isTrue(f32 is t16);
  Expect.isTrue(f33 is t16);
  Expect.isTrue(f34 is t16);
  Expect.isTrue(f35 is t16);
  Expect.isTrue(f36 is t16);
  Expect.isTrue(f37 is t16);
  Expect.isTrue(f38 is t16);
  Expect.isTrue(f39 is t16);
  checkType(checkIs<t16>, true, f29);
  checkType(checkIs<t16>, true, f30);
  checkType(checkIs<t16>, true, f31);
  checkType(checkIs<t16>, true, f32);
  checkType(checkIs<t16>, true, f33);
  checkType(checkIs<t16>, true, f34);
  checkType(checkIs<t16>, true, f35);
  checkType(checkIs<t16>, true, f36);
  checkType(checkIs<t16>, true, f37);
  checkType(checkIs<t16>, true, f38);
  checkType(checkIs<t16>, true, f39);
}
