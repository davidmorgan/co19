// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion
/// Future<RandomAccessFile> lock([
///     FileLock mode = FileLock.exclusive,
///     int start = 0,
///     int end = -1
/// ])
/// . . .
/// If mode is FileLock.exclusive or FileLock.shared, an error is signaled if the
/// lock cannot be obtained. If mode is FileLock.blockingExclusive or
/// FileLock.blockingShared, the returned Future is resolved only when the lock
/// has been obtained.
///
/// @description Checks that if mode is FileLock.shared, an error is signaled if
/// the lock cannot be obtained.
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "lock_check_3_lib.dart";

void check(int fLen) {
  File file = getTempFileSync();
  asyncStart();
  var rf = file.openSync(mode: FileMode.write);
  rf.writeFromSync(new List.filled(fLen, 1));

  var rfLock = rf.lock(FileLock.exclusive);

  rfLock.then((RandomAccessFile f) {
    var tests = [
      () => checkLocked(
          Platform.script.toString(), f.path, 0, -1, FileLock.shared)
    ];
    Future.forEach(tests, (Function f) => f()).whenComplete(() {
      asyncEnd();
      rf.unlockSync();
      rf.closeSync();
      file.deleteSync();
    });
  });
}

runMain() {
  check(10);
  check(1000);
}

main(List<String> args) {
  if (args.length > 0)
    runProcess(args);
  else {
    runMain();
  }
}
