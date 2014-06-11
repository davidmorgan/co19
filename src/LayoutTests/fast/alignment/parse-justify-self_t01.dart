/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that setting and getting justify-self works as expected
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      #justifySelfBaseline {
          justify-self: baseline;
      }

      #justifySelfStretch {
          justify-self: stretch;
      }

      #justifySelfStart {
          justify-self: start;
      }

      #justifySelfEnd {
          justify-self: end;
      }

      #justifySelfCenter {
          justify-self: center;
      }

      #justifySelfSelfStart {
          justify-self: self-start;
      }

      #justifySelfSelfEnd {
          justify-self: self-end;
      }

      #justifySelfLeft {
          justify-self: left;
      }

      #justifySelfRight {
          justify-self: right;
      }

      #justifySelfEndTrue {
          justify-self: end true;
      }

      #justifySelfCenterTrue {
          justify-self: center true;
      }

      #justifySelfSelfEndSafe {
          justify-self: self-end safe;
      }

      #justifySelfSelfStartSafe {
          justify-self: self-start safe;
      }

      #justifySelfRightSafe {
          justify-self: right safe;
      }

      #justifySelfLeftTrue {
          justify-self: left true;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="justifySelfBaseline"></div>
      <div id="justifySelfStretch"></div>
      <div id="justifySelfStart"></div>
      <div id="justifySelfEnd"></div>
      <div id="justifySelfCenter"></div>
      <div id="justifySelfSelfStart"></div>
      <div id="justifySelfSelfEnd"></div>
      <div id="justifySelfLeft"></div>
      <div id="justifySelfRight"></div>

      <div id="justifySelfEndTrue"></div>
      <div id="justifySelfCenterTrue"></div>
      <div id="justifySelfSelfEndSafe"></div>
      <div id="justifySelfSelfStartSafe"></div>
      <div id="justifySelfRightSafe"></div>
      <div id="justifySelfLeftTrue"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  getComputedStyle(elt, [unused]) => elt.getComputedStyle();

  debug("Test getting justify-self set through CSS");
  var justifySelfBaseline = document.getElementById("justifySelfBaseline");
  shouldBe(getComputedStyle(justifySelfBaseline, '').getPropertyValue('justify-self'), 'baseline');

  var justifySelfStretch = document.getElementById("justifySelfStretch");
  shouldBe(getComputedStyle(justifySelfStretch, '').getPropertyValue('justify-self'), 'stretch');

  var justifySelfStart = document.getElementById("justifySelfStart");
  shouldBe(getComputedStyle(justifySelfStart, '').getPropertyValue('justify-self'), 'start');

  var justifySelfEnd = document.getElementById("justifySelfEnd");
  shouldBe(getComputedStyle(justifySelfEnd, '').getPropertyValue('justify-self'), 'end');

  var justifySelfCenter = document.getElementById("justifySelfCenter");
  shouldBe(getComputedStyle(justifySelfCenter, '').getPropertyValue('justify-self'), 'center');

  var justifySelfSelfEnd = document.getElementById("justifySelfSelfEnd");
  shouldBe(getComputedStyle(justifySelfSelfEnd, '').getPropertyValue('justify-self'), 'self-end');

  var justifySelfSelfStart = document.getElementById("justifySelfSelfStart");
  shouldBe(getComputedStyle(justifySelfSelfStart, '').getPropertyValue('justify-self'), 'self-start');

  var justifySelfLeft = document.getElementById("justifySelfLeft");
  shouldBe(getComputedStyle(justifySelfLeft, '').getPropertyValue('justify-self'), 'left');

  var justifySelfRight = document.getElementById("justifySelfRight");
  shouldBe(getComputedStyle(justifySelfRight, '').getPropertyValue('justify-self'), 'right');

  var justifySelfEndTrue = document.getElementById("justifySelfEndTrue");
  shouldBe(getComputedStyle(justifySelfEndTrue, '').getPropertyValue('justify-self'), 'end true');

  var justifySelfCenterTrue = document.getElementById("justifySelfCenterTrue");
  shouldBe(getComputedStyle(justifySelfCenterTrue, '').getPropertyValue('justify-self'), 'center true');

  var justifySelfSelfEndSafe = document.getElementById("justifySelfSelfEndSafe");
  shouldBe(getComputedStyle(justifySelfSelfEndSafe, '').getPropertyValue('justify-self'), 'self-end safe');

  var justifySelfSelfStartSafe = document.getElementById("justifySelfSelfStartSafe");
  shouldBe(getComputedStyle(justifySelfSelfStartSafe, '').getPropertyValue('justify-self'), 'self-start safe');

  var justifySelfRightSafe = document.getElementById("justifySelfRightSafe");
  shouldBe(getComputedStyle(justifySelfRightSafe, '').getPropertyValue('justify-self'), 'right safe');

  var justifySelfLeftTrue = document.getElementById("justifySelfLeftTrue");
  shouldBe(getComputedStyle(justifySelfLeftTrue, '').getPropertyValue('justify-self'), 'left true');

  debug("Test initial value of justify-self through JS");
  var element = document.createElement("div");
  document.body.append(element);
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  /*
  debug("Test getting and setting justify-self through JS");
  element = document.createElement("div");
  document.body.append(element);
  element.style.justifySelf = "center";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'center');

  element = document.createElement("div");
  document.body.append(element);
  element.style.justifySelf = "true start";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'start true');

  element.style.justifySelf = "auto";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  debug("Test bad combinaisons of justify-self");
  element = document.createElement("div");
  document.body.append(element);
  element.style.justifySelf = "true auto";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "auto safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "auto left";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "baseline safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "baseline center";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "stretch true";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "stretch right";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "true true";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto')

  element.style.justifySelf = "true safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "center start";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "stretch true";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "safe stretch";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "baseline safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "true baseline";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "true safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "true safe left";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "true left safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  element.style.justifySelf = "left safe true safe";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  debug("Test the value 'initial'");
  element.style.justifySelf = "center";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'center');
  element.style.justifySelf = "initial";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'auto');

  debug("Test the value 'inherit'");
  parentElement = document.createElement("div");
  document.body.append(parentElement);
  parentElement.style.justifySelf = "end";
  shouldBe(getComputedStyle(parentElement, '').getPropertyValue('justify-self'), 'end');

  element = document.createElement("div");
  parentElement.append(element);
  element.style.justifySelf = "inherit";
  shouldBe(getComputedStyle(element, '').getPropertyValue('justify-self'), 'end');
  */
}
