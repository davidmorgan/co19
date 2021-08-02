// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion int value
/// The 64-bit two's complement integer at address.
///
/// @description Check that a Dart integer is not truncated before being stored
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int32> p = calloc<Int32>();
  Expect.equals(0, p.value);
  p.value = 0xFFFFFFFFFFFFFFFF;
  Expect.equals(0xFFFFFFFFFFFFFFFF, p.value);
}
