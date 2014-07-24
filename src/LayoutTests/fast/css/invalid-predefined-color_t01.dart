/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test checks hexadecimal color parsing.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setAttribute("style", "color: black");

  document.body.setInnerHtml('''
      <div id="valid1" style="color: red">This style is "color: red"</div>
      <div id="valid2" style="color: FF0000">This style is "color: FF0000"</div>
      <div id="valid3" style="color: #FF0000">This style is "color: #FF0000"</div>
      <div id="valid4" style="color: F00">This style is "color: F00"</div>
      <div id="valid5" style="color: #F00">This style is "color: #F00"</div>
      <div id="invalid1" style="color: #red">This style is "color: #red"</div>
      <div id="invalid2" style="color: #yellow">This style is "color: #yellow"</div>
      <div id="invalid3" style="color: #green">This style is "color: #green"</div>
      <div id="invalid4" style="color: #FFAALL">This style is "color: #FFAALL"</div>
      <div id="invalid5" style="color: #FF000000">This style is "color: #FF000000"</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var red = "rgb(255, 0, 0)";
  var black = "rgb(0, 0, 0)";

  for (var i=1;i<=5;i++)
  {
    var id = "valid$i";
    debug(id);
    var div = document.getElementById(id);
    shouldBe(getComputedStyle(div, null).color, red);
  }

  for (var i=1;i<=5;i++)
  {
    var id = "invalid$i";
    debug(id);
    var div = document.getElementById(id);
    shouldBe(getComputedStyle(div, null).color, black);
  }
}
