# safari-link-to-markdown-service
This Applescript workflow grabs the current url in the active Safari tab and puts it into clipboard in nicely formatted markdown.

VERY handy if you do lots of note taking and url collecting in a markdown editor.

I find the Title very useful formatted this way:

'[Page title up to 30 chars… (sourcedomain.com)](https://sourcedomain.com/whatever.html)'

The sourcedomain.com extraction is reasonably smart. Discards 'www.' but keeps most other subdomains. Seems to work across every weird case I've tried.

Lots of complexity for something only a little bettern than "Command-L That will highlight the URL field Then just select Command-C to copy." but I still use it ~20x per day.

## Installation
This Applescript is intended to be run as a MacOS X Service.

Place it in ~/Library/Services. Then assign a keyboard shortcut to activate it in System Preferences -> Keyboard -> Shortcuts -> Services. I personally use cnd-shift-c as this mirrors "paste as" in Ulysses (where I do most of my markdown baesd note taking.
