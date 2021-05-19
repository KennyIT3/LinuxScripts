grep --include=*.xml -rlw '/opt/IBM/WebSphere/AppServer/profiles' -e 'wincornixdorf.com'

-r ==Recursive
-l == files-with-matches
-w == Select only those lines containing matches that form whole words.
-e == Use PATTERN as the pattern.
