/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests background shortand property with background-size
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="test"> </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var e = document.getElementById('test');
  var computedStyle = e.getComputedStyle();

  checkStyle() {
    var before = e.style.background;
    e.style.background = 'none';
    e.style.background = before;
    return (e.style.background == before);
  }

  checkComputedStyleValue() {
    var before = e.getComputedStyle().getPropertyValue('background');
    e.style.background = 'none';
    e.style.background = before;
    return (e.getComputedStyle().getPropertyValue('background') == before);
  }

  e.style.background = "center / cover red url(dummy://test.png) no-repeat border-box";
  shouldBe(e.style.background, 'url(dummy://test.png) 50% 50% / cover no-repeat border-box border-box red');
  shouldBe(e.style.backgroundSize, 'cover');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgb(255, 0, 0) url(dummy://test.png) no-repeat scroll 50% 50% / cover border-box border-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), 'cover');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "red 20px / contain url(dummy://test.png) no-repeat padding-box";
  shouldBe(e.style.background, 'url(dummy://test.png) 20px 50% / contain no-repeat padding-box padding-box red');
  shouldBe(e.style.backgroundSize, 'contain');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgb(255, 0, 0) url(dummy://test.png) no-repeat scroll 20px 50% / contain padding-box padding-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), 'contain');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "red url(dummy://test.png) 50px 60px / 50% 75% no-repeat";
  shouldBe(e.style.background, 'url(dummy://test.png) 50px 60px / 50% 75% no-repeat red');
  shouldBe(e.style.backgroundSize, '50% 75%');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgb(255, 0, 0) url(dummy://test.png) no-repeat scroll 50px 60px / 50% 75% padding-box border-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), '50% 75%');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "red url(dummy://test.png) repeat top left / 100px 200px border-box content-box";
  shouldBe(e.style.background, 'url(dummy://test.png) 0% 0% / 100px 200px repeat border-box content-box red');
  shouldBe(e.style.backgroundSize, '100px 200px');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgb(255, 0, 0) url(dummy://test.png) repeat scroll 0% 0% / 100px 200px border-box content-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), '100px 200px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "red url(dummy://test.png) repeat 50% / auto auto content-box padding-box";
  shouldBe(e.style.background, 'url(dummy://test.png) 50% 50% / auto repeat content-box padding-box red');
  shouldBe(e.style.backgroundSize, 'auto');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgb(255, 0, 0) url(dummy://test.png) repeat scroll 50% 50% / auto content-box padding-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), 'auto');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "url(dummy://test.png) red 50px 60px / 50% no-repeat fixed";
  shouldBe(e.style.background, 'url(dummy://test.png) 50px 60px / 50% no-repeat fixed red');
  shouldBe(e.style.backgroundSize, '50%');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgb(255, 0, 0) url(dummy://test.png) no-repeat fixed 50px 60px / 50% padding-box border-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), '50%');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "red repeat scroll padding-box border-box top left / 100px url(dummy://test.png)";
  shouldBe(e.style.background, 'url(dummy://test.png) 0% 0% / 100px repeat scroll padding-box border-box red');
  shouldBe(e.style.backgroundSize, '100px');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgb(255, 0, 0) url(dummy://test.png) repeat scroll 0% 0% / 100px padding-box border-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), '100px');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "50% / auto fixed url(dummy://test.png) repeat content-box red";
  shouldBe(e.style.background, 'url(dummy://test.png) 50% 50% / auto repeat fixed content-box content-box red');
  shouldBe(e.style.backgroundSize, 'auto');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgb(255, 0, 0) url(dummy://test.png) repeat fixed 50% 50% / auto content-box content-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), 'auto');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "top left / 50%";
  shouldBe(e.style.background, '0% 0% / 50%');
  shouldBe(e.style.backgroundSize, '50%');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgba(0, 0, 0, 0) none repeat scroll 0% 0% / 50% padding-box border-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), '50%');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "red fixed";
  shouldBe(e.style.background, 'fixed red');
  shouldBe(e.style.backgroundSize, 'initial');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgb(255, 0, 0) none repeat fixed 0% 0% / auto padding-box border-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), 'auto');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "";
  e.style.background = "red / cover url(dummy://test.png) repeat";
  shouldBe(e.style.background, '');
  shouldBe(e.style.backgroundSize, '');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgba(0, 0, 0, 0) none repeat scroll 0% 0% / auto padding-box border-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), 'auto');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "";
  e.style.background = "red url(dummy://test.png) repeat 25px / contain contain";
  shouldBe(e.style.background, '');
  shouldBe(e.style.backgroundSize, '');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgba(0, 0, 0, 0) none repeat scroll 0% 0% / auto padding-box border-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), 'auto');
  shouldBe(checkComputedStyleValue(), true);

  e.style.background = "";
  e.style.background = "red top left / 100px cover url(dummy://test.png) repeat";
  shouldBe(e.style.background, '');
  shouldBe(e.style.backgroundSize, '');
  shouldBe(checkStyle(), true);
  shouldBe(computedStyle.getPropertyValue("background"), 'rgba(0, 0, 0, 0) none repeat scroll 0% 0% / auto padding-box border-box');
  shouldBe(computedStyle.getPropertyValue("background-size"), 'auto');
  shouldBe(checkComputedStyleValue(), true);
}
