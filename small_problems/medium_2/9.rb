=begin

Given an array, create an program that implements the bubble sort algorithm
- the array is mutated in place and contains two elements minimum

Examples:
  [6, 2, 7, 1, 4], elements 1..5
    6 > 2 -> y -> [2, 6, 7, 1, 4]
    6 > 7 -> n -> [2, 6, 7, 1, 4]
    7 > 1 -> y -> [2, 6, 1, 7, 4]
    7 > 4 -> y -> [2, 6, 1, 4, 7]

  [2, 6, 1, 4, 7], elements 1..4
    2, 6 skip
    6, 1 swap [2, 1, 6, 4, 7]
    6, 4 swap [2, 1, 4, 6, 7]

  [2, 1, 4, 6, 7], elements 1..3
    1, 2 swap [1, 2, 4, 6, 7]
    2, 4 skip

  [1, 2, 4, 6, 7]

  %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
    -> %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

  Data Structures:
  - beginning: array of integers or strings
  - ending: same array, but mutated and sorted smallest to largest

  Algorithm:
  - Create a new array
  - loop until
  - from elements 0 to n-1 - decrementor
    - if element is greater than element + 1, swap
    - increment decrementor by 1
  - mutate original array to new array

=end

def bubble_sort!(array)
  decrementor = 0

  until decrementor == array.size
    0..((array.size - 1) - decrementor).times do |index|
      array[index], array[index + 1] = array[index + 1], array[index] if array[index] > array[index + 1]
    end

    decrementor += 1
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w[Sue Pete Alice Tyler Rachel Kim Bonnie]
bubble_sort!(array)
p array == %w[Alice Bonnie Kim Pete Rachel Sue Tyler]
