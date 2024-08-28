def substrings (input_string, dictionary)

  # Create new array for the matching words between input string and dictionary
  matching_words = Array.new()

  # Remove numeric / special characters and split the string into an array of substrings
  input_string = input_string.downcase.tr('^a-zA-Z" "','').split(" ")

  # Iterate through each input string word to find matching dictionary substrings
  input_string.each do |input_word|
    matching_words.push(dictionary.filter {|dictionary_word| input_word.include?(dictionary_word)})
  end 

  # Return the flattened array tallys
  return matching_words.flatten.sort.tally

end  