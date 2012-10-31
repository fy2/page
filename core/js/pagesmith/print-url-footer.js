/**
 * Code to add printable URL in footer of page. This script takes the
 * URL and embeds it at the end of the footer block (#footer). If
 * there is a qr image in the page - then the short (qr code based) url
 * is also displayed above the real URL...
 * @author:   js5 (James Smith)
 * @version:  $Id: print-url-footer.js 7 2012-07-24 13:49:05Z js5 $
 * @requires: jQuery
 */

/*----------------------------------------------------------------------
  Footer code
------------------------------------------------------------------------
  Dependency: none
------------------------------------------------------------------------
  Add a print only div to the footer so that it  displays the href,
  when printed
----------------------------------------------------------------------*/

$(function () {
  var links = $('.qr a'), qlink;
  if (links.length) {
    qlink = links[0].href;
    $('#footer').append('<p>' + qlink + '<br />' + window.location.href + '</p>');
  } else {
    $('#footer').append('<p>' + window.location.href + '</p>');
  }
});

