# frozen_string_literal: true

def merge_sort(array)
  # Sort
  arr_length = array.length
  arr_mid = (arr_length / 2).round

  return array if arr_length <= 1

  left_arr = array.take(arr_mid)
  right_arr = array.drop(arr_mid)

  sorted_left_arr = merge_sort(left_arr)
  sorted_right_arr = merge_sort(right_arr)

  merge(sorted_left_arr, sorted_right_arr)
end

def merge(sorted_left_arr, sorted_right_arr)
  return sorted_left_arr if sorted_right_arr.empty?

  return sorted_right_arr if sorted_left_arr.empty?

  next_num = if sorted_left_arr.first <= sorted_right_arr.first
               sorted_left_arr.shift
             else
               sorted_right_arr.shift
             end

  list = merge(sorted_left_arr, sorted_right_arr)

  [next_num].concat(list)
end
