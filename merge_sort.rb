# Method will take an array and recursively call itself to merge sort.

def merge_sort(array)
  return array if array.length == 1

  result = []
  break_point = array.length / 2 - 1
  first_half = merge_sort(array[0..break_point])
  second_half = merge_sort(array[break_point + 1..-1])

  until first_half.empty? && second_half.empty?
    result = push_least_element(result, first_half, second_half)
  end

  result
end

def push_least_element(result, first_array, second_array)
  if first_array.empty?
    result.push(second_array.slice!(0))
  elsif second_array.empty?
    result.push(first_array.slice!(0))
  elsif first_array[0] < second_array[0]
    result.push(first_array.slice!(0))
  elsif second_array[0] < first_array[0]
    result.push(second_array.slice!(0))
  end
end