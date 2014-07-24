/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Check if replacing innerHtml handles :last-child properly.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      div p:first-child {
        color: blue;
      }
      div p:last-child {
        color: purple;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
<p id="description"></p>
<div id="threeChildren">
<p>a</p><p>b</p><p>c</p>
</div>
<div id="oneChild">
</div>
<div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  replace(x) {
    x.innerHtml = "<p>1</p><p>2</p><p>3</p>";
  }

  var element = null;

  debug("Replacing three children.");
  replace(document.getElementById("threeChildren"));
  element = document.getElementById("threeChildren").firstChild;
  shouldBe(getComputedStyle(element).getPropertyValue('color'), 'rgb(0, 0, 255)');
  element = element.nextNode;
  shouldBe(getComputedStyle(element).getPropertyValue('color'), 'rgb(0, 0, 0)');
  element = element.nextNode;
  shouldBe(getComputedStyle(element).getPropertyValue('color'), 'rgb(128, 0, 128)');

  debug("Replacing one child.");
  replace(document.getElementById("oneChild"));
  element = document.getElementById("oneChild").firstChild;
  shouldBe(getComputedStyle(element).getPropertyValue('color'), 'rgb(0, 0, 255)');
  element = element.nextNode;
  shouldBe(getComputedStyle(element).getPropertyValue('color'), 'rgb(0, 0, 0)');
  element = element.nextNode;
  shouldBe(getComputedStyle(element).getPropertyValue('color'), 'rgb(128, 0, 128)');

  document.getElementById("threeChildren").innerHtml = "";
  document.getElementById("oneChild").innerHtml = "";
}
