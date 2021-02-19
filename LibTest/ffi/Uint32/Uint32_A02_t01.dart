/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Represents a native unsigned 32 bit integer in C.
 *
 * @description Checks that this type represents a native unsigned 32 bit
 * integer in C.
 * @author sgrekhov@unipro.ru
 */
import "dart:ffi";
import "../ffi_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Uint32> p1 = calloc<Uint32>(3);
  try {
    Expect.equals(4, p1.elementAt(1).address - p1.address);
    Expect.equals(4, p1.elementAt(2).address - p1.elementAt(1).address);
  } finally {
    calloc.free(p1);
  }
}
