# Substrings
https://github.com/bjake5/ruby-projects/tree/master/substrings
## Feature Description
* This is a Ruby function to count the number of substrings in an input string that match a defined word dictionary.
## Interface
* IRB / REPLs
## Inputs
* [Array] – A dictionary with words to search for within the input string.
* String – An input string.
## Outputs
* {Hash} – Key: Dictionary word found in the input string | Value: Count within the input string
## Example
`dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]`

`substrings("Howdy partner, sit down! How's it going?", dictionary)`
`=> { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }`
