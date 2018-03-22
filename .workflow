-- This gets current page in Safari and puts a markdown link the clipboard
-- VERY handy if you do lots of note taking. I gather lots of urls and take notes in markdown
-- I wanted a way to grab pages and put them in notes that looked nice and
-- compact and useful.
-- Links will look like this:
-- DOMAIN - TITLE
-- with title trimmed to a legth specified by titleDisplayLength
-- packaged as a service so it can be assigned a keyboard shortcut
-- Lots of complexity for something only a little bettern than "Command-L That will highlight the URL field Then just select Command-C to copy."
-- But I still use the 20x per day.

on run {input, parameters}
	
	tell application "Safari"
		set titleDisplayLength to 30
		set theURL to URL of front document
		set theTitle to name of front document
		if (length of theTitle > titleDisplayLength) then
			set theTrimmedTitle to text 1 thru titleDisplayLength of theTitle
			set theTrimmedTitle to theTrimmedTitle & "…"
		else
			set theTrimmedTitle to theTitle
		end if

		--	set theDomain to do shell script "echo " & quoted form of theURL & " | awk -F/ '{print $3}'"
		
		set theDomain to do shell script "echo " & quoted form of theURL & " | awk -F/ '{print $3}' | awk '{gsub(\"www.|/.*\",\"\")}1'" -- use awk to extract the domain and remove www
		
		
		set the clipboard to "[" & theTrimmedTitle & " (" & theDomain & ")" & "]" & "(" & theURL & ")" as string
	end tell
	
	display notification theTrimmedTitle with title "Link copied into markdown" subtitle theURL
	
	return input
end run
