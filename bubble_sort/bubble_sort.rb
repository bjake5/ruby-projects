# Function to organize numbers using a "bubble sort" algorithm
# This algorithm is not performant, but helpful for educational demonstration
def bubble_sort (numbers)

  # Utilized Ruby sort function to simplify identifying when the numbers were sorted
  while numbers != numbers.sort
    # Iterate through each element in the array to determine if it's sorted vs. the element n+1 
    numbers.each_with_index do |number, index|
      # Escape from the function if the element is last and there is no element n+1
      if numbers[index+1] == nil
        break
      # Switch the values if element n+1 is greater than element n
      elsif number > numbers[index+1]
        numbers[index] = numbers[index+1]
        numbers[index+1] = number
      end
    end
  end
  # Return the final array of sorted
  return numbers
  
end