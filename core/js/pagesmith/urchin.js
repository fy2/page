/**
 * Page initializer for the tracking cookie.  Call the urchinTracker main
 * code to generate the __utm.gif in the page, and consequently the
 * tracking cookies
 *
 * @author:   js5 (James Smith)
 * @version:  $Id: urchin.js 7 2012-07-24 13:49:05Z js5 $
 * @requires: urchin.js
 */

PageSmith.urchin = {
  init: function () {
    /*jsl:ignore*/
    if (Cookie.get('DNT') !== '1') {
      urchinTracker();
    }
    /*jsl:end*/
  }
};

$(function () { PageSmith.urchin.init(); } );
