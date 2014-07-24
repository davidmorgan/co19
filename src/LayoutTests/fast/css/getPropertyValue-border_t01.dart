/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description https://bugs.webkit.org/show_bug.cgi?id=15823
 * Bug 15823: getPropertyValue for border returns null, should compute the
 * shorthand value
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style type="text/css">
       .test {
          display: inline-block;
          height: 5em;
          width: 10em;
          text-align: center;
          vertical-align: middle;
       }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
        <div id="border1" class="test" style="border: 5px solid green;">1</div>
        <div id="border2" class="test" style="border-left: 5px solid red; border-top: 5px solid green; border-right: 5px solid blue; border-bottom: 5px solid purple;">2</div>
        <div id="border3" class="test" style="border-left: 5px dashed green; border-top: 5px solid green; border-right: 5px dotted green; border-bottom: 5px groove green;">3</div>
        <div id="border4" class="test" style="border-left: 4px solid green; border-top: 5px solid green; border-right: 5px solid green; border-bottom: 5px solid green;">4</div>
        <div id="border5" class="test" style="border-left: 2px dashed green; border-top: 3px solid green; border-right: 4px dotted green; border-bottom: 5px groove green;">5</div>
        <div id="border6" class="test" style="border-left: 5px dashed red; border-top: 5px solid green; border-right: 5px dotted blue; border-bottom: 5px groove purple;">6</div>
        <div id="border7" class="test" style="border-left: 2px solid red; border-top: 3px solid green; border-right: 4px solid blue; border-bottom: 5px solid purple;">7</div>
        <div id="border8" class="test" style="border-left: 2px dashed red; border-top: 3px solid green; border-right: 5px dotted blue; border-bottom: 5px groove purple;">8</div>
        <div id="border9" class="test" style="border-left: 5px solid red; border-top: 5px solid green; border-right: 5px solid blue;">9</div>
      <p id="description"></p>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var div1 = document.getElementById("border1");
  shouldBe(div1.style.getPropertyValue("border"), "5px solid green");

  var div2 = document.getElementById("border2");
  shouldBe(div2.style.getPropertyValue("border"), "5px solid");

  var div3 = document.getElementById("border3");
  shouldBe(div3.style.getPropertyValue("border"), "5px green");
  debug("    NOTE: '5px green' is an illegal CSS value for 'border'.");

  var div4 = document.getElementById("border4");
  shouldBe(div4.style.getPropertyValue("border"), "solid green");

  var div5 = document.getElementById("border5");
  shouldBe(div5.style.getPropertyValue("border"), "green");
  debug("    NOTE: 'green' is an illegal CSS value for 'border'.");

  var div6 = document.getElementById("border6");
  shouldBe(div6.style.getPropertyValue("border"), "5px");

  var div7 = document.getElementById("border7");
  shouldBe(div7.style.getPropertyValue("border"), "solid");

  var div8 = document.getElementById("border8");
  //shouldBe(div8.style.getPropertyValue("border"), null);
  shouldBe(div8.style.getPropertyValue("border"), '');

  var div9 = document.getElementById("border9");
  //shouldBe(div9.style.getPropertyValue("border"), null);
  shouldBe(div9.style.getPropertyValue("border"), '');
}
