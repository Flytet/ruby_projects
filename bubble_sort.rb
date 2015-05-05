def bubble_sort(unsorted_array)

  begin
    swapped = false
    unsorted_array.length.times do |i|
      number = unsorted_array[i]
      next_number = unsorted_array[i+1]
      if next_number != nil && (number > next_number)
        unsorted_array[i] = next_number
        unsorted_array[i+1] = number
        swapped = true
      end
    end
  end until swapped == false
  return unsorted_array
end

p bubble_sort([40,3,78,2,0,2, 20, 1, 23, 489, 487123, 22, 24])