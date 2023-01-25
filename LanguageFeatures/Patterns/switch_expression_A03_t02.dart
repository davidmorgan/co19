// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// primary                 ::= // Existing productions...
///                           | switchExpression
///
/// switchExpression      ::= 'switch' '(' expression ')' '{'
///                           switchExpressionCase ( ',' switchExpressionCase )*
///                           ','? '}'
/// switchExpressionCase  ::= guardedPattern '=>' expression
///
/// The body is a series of cases. Each case has a pattern, optional guard, and
/// a single expression body. As with other expression forms containing a list
/// of subelements (argument lists, collection literals), the cases are
/// separated by commas with an optional trailing comma. Since the body of each
/// case is a single expression with a known terminator, it's easy to tell when
/// one case ends and the next begins. That lets us do away with the case
/// keyword.
///
/// To keep the syntax small and light, we also disallow a default clause.
/// Instead, you can use a shorter _ wildcard pattern to catch any remaining
/// values.
///
/// Slotting into primary means it can be used anywhere any expression can
/// appear, even as operands to unary and binary operators. Many of these uses
/// are ugly, but not any more problematic than using a collection literal in
/// the same context since a switch expression is always delimited by a switch
/// and }.
///
/// @description Check that switch expressions can be used as operands of
/// prefix operators
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

int test1(String s) =>
  -switch (s) {
    "one" => 1,
    "two" => 2,
    _ => 0
  };

bool test2(String s) =>
  !switch (s) {
    "true" => true,
    _ => false
  };

int test3(String s) =>
  ~switch (s) {
    "one" => 1,
    "two" => 2,
    _ => 0
  };

main() {
  Expect.equals(-1, test1("one"));
  Expect.equals(-2, test1("two"));
  Expect.equals(0, test1("zero"));
  Expect.isFalse(test2("true"));
  Expect.isTrue(test2("false"));
  Expect.equals(~1, test3("one"));
  Expect.equals(~2, test3("two"));
  Expect.equals(~0, test3("zero"));
}
