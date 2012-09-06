/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Functions include function declarations, methods, getters,
 * setters, constructors and function literals.
 * All functions have a signature and a body.
 * functionSignature:
 *   metadata returnType? identifier formalParameterList
 * ;
 * returnType: void | type
 * ;
 * functionBody:
 *   '=>' expression ';' | block
 * ;
 * block:
 *   '{' statements '}'
 * ;
 * @description Checks that a class can't be defined in a body
 * of a function of the form [functionSignature '{' statements '}'].
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 */

f() {
  class A{};
}

main() {
  try {
    f();
  } catch(x){}
}
