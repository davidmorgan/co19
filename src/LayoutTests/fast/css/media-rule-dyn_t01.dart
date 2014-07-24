/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style id="style1">
          @media all { .test { color: green; } }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="result">FAIL</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest() {
    var styleSheet = document.getElementById('style1').sheet;
    var mediaRule = styleSheet.cssRules[0];

    try {
      var index = mediaRule.insertRule("p {color: red; }", 0);
      if (mediaRule.cssRules.length == 2) {
        mediaRule.deleteRule(0);
        if (mediaRule.cssRules.length == 1)
          document.getElementById('result').innerHtml = 'PASS';
      }
    } catch (e) {
      document.getElementById('result').innerHTML = 'FAIL';
    }
  }

  runTest();
}
