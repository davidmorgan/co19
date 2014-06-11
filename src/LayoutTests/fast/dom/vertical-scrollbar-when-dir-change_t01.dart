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

main() {
  asyncStart();
  document.body.dir = 'rtl';
  document.body
    .setAttribute('style', "-webkit-writing-mode:vertical-lr");

  document.body.setInnerHtml('''
      <div style="height: 4000px; border: 1px solid red;" id="div">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc et nisl tellus. Vivamus aliquam elit non arcu scelerisque eget dapibus nunc vulputate. Maecenas scelerisque egestas purus, id bibendum magna venenatis vel. Vestibulum bibendum volutpat aliquam. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum eget risus sodales mi tristique dignissim et sed lectus. Cras convallis, nibh ut dapibus gravida, enim mauris molestie elit, eget fringilla augue est nec est. Curabitur eu quam non purus sodales pulvinar. Donec ultrices dui eget dolor lobortis in porta quam rutrum. Nulla risus lacus, adipiscing quis ullamcorper vestibulum, condimentum sed lacus. Sed in nunc dolor, quis egestas turpis. Integer arcu tellus, posuere sit amet pellentesque a, molestie at mi. Nulla blandit, mi et euismod imperdiet, augue arcu ornare felis, nec viverra lacus ligula ut metus. Proin ut leo ante, at consectetur sem. Nullam non nunc ligula. Proin sed ante sem, id rutrum purus.
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  assertEqual(msg, actual, expected) {
    debug(msg);
    shouldBe(actual, expected);
  }

  window.onLoad.listen((_) {
    assertEqual("original scroll y for RTL page ", window.scrollY, 0);
    window.scrollTo(0, -100);
    assertEqual("vertical scroll y for RTL page ", window.scrollY, -100);

    document.body.dir = "ltr";
    assertEqual("original scroll y for LTR page ", window.scrollY, 0);
    window.scrollTo(0, 100);
    assertEqual("vertical scroll y for LTR page ", window.scrollY, 100);

    document.getElementById("div").style.display = "none";
    asyncEnd();
  });
}
