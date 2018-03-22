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
		set theDomain to do shell script "echo " & quoted form of theURL & " | awk -F/ '{print $3}' | awk '{gsub(\"www.|/.*\",\"\")}1'" -- use awk to extract the domain and remove www		
		set the clipboard to "[" & theTrimmedTitle & " (" & theDomain & ")" & "]" & "(" & theURL & ")" as string
	end tell
	
	display notification theTrimmedTitle with title "Link copied into markdown" subtitle theURL
	
	return input
end run
