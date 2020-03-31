/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a class declaration declares an instance
 * variable with a potentially non-nullable type and no initializer expression,
 * and the class has a generative constructor where the variable is not
 * initialized via an initializing formal or an initializer list entry, unless
 * the variable is marked with the late modifier.
 *
 * @description Check that it is an error if a class declaration declares an
 * instance variable with a potentially non-nullable type and no initializer
 * expression, and the class has a generative constructor where the variable is
 * not initialized via an initializing formal or an initializer list entry,
 * unless the variable is marked with the late modifier. Test F*, where F is a
 * function type
 * @author sgrekhov@unipro.ru
 * @issue 40951
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "legacy_lib.dart";

class C1 {
  LegacyFoo f;
//          ^
// [cfe] unspecified
  C1() {}
//^^
// [analyzer] COMPILE_TIME_ERROR.NOT_INITIALIZED_NON_NULLABLE_INSTANCE_FIELD
}

abstract class C2 {
  LegacyFoo f;
//          ^
// [cfe] unspecified
  C2() {}
//^^
// [analyzer] COMPILE_TIME_ERROR.NOT_INITIALIZED_NON_NULLABLE_INSTANCE_FIELD
}

class C3 extends C2 {}

main() {
  new C1();
  new C3();
}
