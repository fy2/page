/*----------------------------------------------------------------------
  Accessibilty code

  author: js5 (James Smith)
  svn-id: $Id: accessibility.js 1 2012-07-16 15:48:14Z js5 $
------------------------------------------------------------------------
  Code to change the font size via the "a...a" buttons 
----------------------------------------------------------------------*/

PageSmith.accessibility = {
  set: function (sz) {
    if (sz !== PageSmith.flags.z) {
      PageSmith.flags.z = sz;
      PageSmith.setCookie();
    }
    $('body').attr('class', 's-' + sz);
    $(window).resize();
  },
  init: function () {
    $('#access').find('span').click(function () {
      PageSmith.accessibility.set($(this).attr('id').substr(2, 1));
    });
    PageSmith.accessibility.set(PageSmith.flags.z || 'n');
  }
};
PageSmith.accessibility.init();
