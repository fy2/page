/**
 * Min/max width emulator for IE6. Emulates min/max width of other browsers
 * in Internet Explorer 6
 * @author:   js5 (James Smith)
 * @version:  $Id: ie6-fixed-width.js 7 2012-07-24 13:49:05Z js5 $
 * @requires: jQuery
 */

$(function () {
  if (typeof document.body.style.maxHeight === "undefined" && $('body').attr('id') !== 'homepage') { //if IE 6
    $(window).resize(function () {
      var X = $(window).width() - 20;
      if (X < 780) {
        X = 780;
      }
      if (X > 1380) {
        X = 1380;
      }
      if ($('#outer').width() !== X) {
        $('#outer').width(X);
      }
    });
    $(window).resize();
  }
});
