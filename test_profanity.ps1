#!powerhell

$result=Select-String "**/*.adoc" -Pattern "bl..?dmann"

if ($result -ne $null) {
    echo "Profanity detected, watch your language"
    exit 1
} else {
    echo "Text is clean!"
}

