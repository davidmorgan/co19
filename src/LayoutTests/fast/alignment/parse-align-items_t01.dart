/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that setting and getting align-items works as expected
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      #alignItemsBaseline {
          align-items: baseline;
      }

      #alignItemsStretch {
          align-items: stretch;
      }

      #alignItemsStart {
          align-items: start;
      }

      #alignItemsEnd {
          align-items: end;
      }

      #alignItemsCenter {
          align-items: center;
      }

      #alignItemsItemsStart {
          align-items: self-start;
      }

      #alignItemsItemsEnd {
          align-items: self-end;
      }

      #alignItemsLeft {
          align-items: left;
      }

      #alignItemsRight {
          align-items: right;
      }

      #alignItemsEndTrue {
          align-items: end true;
      }

      #alignItemsCenterTrue {
          align-items: center true;
      }

      #alignItemsItemsEndSafe {
          align-items: self-end safe;
      }

      #alignItemsItemsStartSafe {
          align-items: self-start safe;
      }

      #alignItemsRightSafe {
          align-items: right safe;
      }

      #alignItemsLeftTrue {
          align-items: left true;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="alignItemsBaseline"></div>
      <div id="alignItemsStretch"></div>
      <div id="alignItemsStart"></div>
      <div id="alignItemsEnd"></div>
      <div id="alignItemsCenter"></div>
      <div id="alignItemsItemsStart"></div>
      <div id="alignItemsItemsEnd"></div>
      <div id="alignItemsLeft"></div>
      <div id="alignItemsRight"></div>

      <div id="alignItemsEndTrue"></div>
      <div id="alignItemsCenterTrue"></div>
      <div id="alignItemsItemsEndSafe"></div>
      <div id="alignItemsItemsStartSafe"></div>
      <div id="alignItemsRightSafe"></div>
      <div id="alignItemsLeftTrue"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  getComputedStyle(elt, [unused]) => elt.getComputedStyle();

  debug("Test getting align-items set through CSS");
  var alignItemsBaseline = document.getElementById("alignItemsBaseline");
  shouldBe(getComputedStyle(alignItemsBaseline, '').getPropertyValue('align-items'), 'baseline');

  var alignItemsStretch = document.getElementById("alignItemsStretch");
  shouldBe(getComputedStyle(alignItemsStretch, '').getPropertyValue('align-items'), 'stretch');

  var alignItemsStart = document.getElementById("alignItemsStart");
  shouldBe(getComputedStyle(alignItemsStart, '').getPropertyValue('align-items'), 'start');

  var alignItemsEnd = document.getElementById("alignItemsEnd");
  shouldBe(getComputedStyle(alignItemsEnd, '').getPropertyValue('align-items'), 'end');

  var alignItemsCenter = document.getElementById("alignItemsCenter");
  shouldBe(getComputedStyle(alignItemsCenter, '').getPropertyValue('align-items'), 'center');

  var alignItemsItemsEnd = document.getElementById("alignItemsItemsEnd");
  shouldBe(getComputedStyle(alignItemsItemsEnd, '').getPropertyValue('align-items'), 'self-end');

  var alignItemsItemsStart = document.getElementById("alignItemsItemsStart");
  shouldBe(getComputedStyle(alignItemsItemsStart, '').getPropertyValue('align-items'), 'self-start');

  var alignItemsLeft = document.getElementById("alignItemsLeft");
  shouldBe(getComputedStyle(alignItemsLeft, '').getPropertyValue('align-items'), 'left');

  var alignItemsRight = document.getElementById("alignItemsRight");
  shouldBe(getComputedStyle(alignItemsRight, '').getPropertyValue('align-items'), 'right');

  var alignItemsEndTrue = document.getElementById("alignItemsEndTrue");
  shouldBe(getComputedStyle(alignItemsEndTrue, '').getPropertyValue('align-items'), 'end true');

  var alignItemsCenterTrue = document.getElementById("alignItemsCenterTrue");
  shouldBe(getComputedStyle(alignItemsCenterTrue, '').getPropertyValue('align-items'), 'center true');

  var alignItemsItemsEndSafe = document.getElementById("alignItemsItemsEndSafe");
  shouldBe(getComputedStyle(alignItemsItemsEndSafe, '').getPropertyValue('align-items'), 'self-end safe');

  var alignItemsItemsStartSafe = document.getElementById("alignItemsItemsStartSafe");
  shouldBe(getComputedStyle(alignItemsItemsStartSafe, '').getPropertyValue('align-items'), 'self-start safe');

  var alignItemsRightSafe = document.getElementById("alignItemsRightSafe");
  shouldBe(getComputedStyle(alignItemsRightSafe, '').getPropertyValue('align-items'), 'right safe');

  var alignItemsLeftTrue = document.getElementById("alignItemsLeftTrue");
  shouldBe(getComputedStyle(alignItemsLeftTrue, '').getPropertyValue('align-items'), 'left true');

  debug("Test initial value of align-items through JS");
  var element = document.createElement("div");
  document.body.append(element);
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  debug("Test getting and setting align-items through JS");
  element = document.createElement("div");
  document.body.append(element);
  element.style.alignItems = "center";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'center');

  element = document.createElement("div");
  document.body.append(element);
  element.style.alignItems = "true start";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'start true');

  element.style.alignItems = "auto";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'auto');

  debug("Test bad combinaisons of align-items");
  element = document.createElement("div");
  document.body.append(element);
  element.style.alignItems = "true auto";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "auto safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "auto left";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "baseline safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "baseline center";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "stretch true";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "stretch right";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "true true";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "true safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "center start";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "stretch true";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "safe stretch";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "baseline safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "true baseline";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "true safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "true safe left";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "true left safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  element.style.alignItems = "left safe true safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  debug("Test the value 'initial'");
  element.style.alignItems = "center";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'center');
  element.style.alignItems = "initial";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'stretch');

  debug("Test the value 'inherit'");
  var parentElement = document.createElement("div");
  document.body.append(parentElement);
  parentElement.style.alignItems = "end";
  shouldBe(getComputedStyle(parentElement, '').getPropertyValue('align-items'), 'end');

  element = document.createElement("div");
  parentElement.append(element);
  element.style.alignItems = "inherit";
  shouldBe(getComputedStyle(element, '').getPropertyValue('align-items'), 'end');
}
