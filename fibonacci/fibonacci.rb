# frozen_string_literal: true

def fibs(num)
  arr = []
  arr << 0
  arr << 1
  while arr.length < num
    sum = arr[-2] + arr[-1]
    arr << sum
  end
  arr
end

def fibs_rec(num)
  return [0] if num.zero?
  return [0, 1] if num == 1

  arr = fibs_rec(num - 1)
  arr << arr[-2] + arr[-1]
end

fibs(8)
fibs_rec(8)
