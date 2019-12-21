// More info about how user.js works:
// - https://github.com/ghacksuserjs/ghacks-user.js/wiki/1.1-Overview
// - http://kb.mozillazine.org/User.js_file


// Switch among the recently used tabs when pressing ctrl+tab (super useful!)
user_pref("browser.ctrlTab.recentlyUsedOrder", true);


// Just scroll to the left/right when swiping with trackpad
user_pref("browser.gesture.swipe.left", "cmd_scrollLeft");
user_pref("browser.gesture.swipe.right", "cmd_scrollRight");


// TODO consider this in the future:
// When user attempts to preview a file Firefox downloads it to the default directory by default.
// The problem is that the download directory gets polluted quite quickly!
// The best setup is to download to tmp directory for preview and ask where to download if user wants to save the file.
// user_pref("browser.download.dir", "/private/tmp");


// Indicates whether or not the user's preference is to automatically save files into the download directory.
// If this value is false, the user is asked what to do.
user_pref("browser.download.useDownloadDir", false);


// Possible values:
// 0: Firefox will save all files downloaded via the browser on the user's desktop
// 1: these downloads are stored in the Downloads folder
// 2: the location specified for the most recent download is utilized again
user_pref("browser.download.lastDir", 2);


// Possible values:
// 0: Start with a blank page (about:blank)
// 1: Start with the web page(s) defined as the home page(s). (Default)
// 2: Load the last visited page
// 3: Resume the previous browser session
user_pref("browser.startup.page", 3);


// Come on, everybody wants this by default!
user_pref("findbar.highlightAll", true);
