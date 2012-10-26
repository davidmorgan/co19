/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws an EmptyQueueException if the queue is empty.
 * @description Checks that exception is thrown if no element is left.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue queue = new Queue();
  
  try {
    queue.last;
    Expect.fail("Exception is expected");
  } on EmptyQueueException catch(e) {}
  
  queue.addFirst(1);
  queue.addFirst(2);
  queue.clear();
  
  try {
    queue.last;
    Expect.fail("Exception is expected");
  } on EmptyQueueException catch(e) {}
}
