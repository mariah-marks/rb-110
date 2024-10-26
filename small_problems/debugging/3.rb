=begin

The code should return true if the series contains exactly 3 odd numbers and if the sum is 47

On line 5, the ternerary expression evalutes the `odd_count = 3`, which is re-assignment, instead of
equality comparison `odd_count == 3`. Because everything other than `false` and `nil` evaluate as true,
this expression will always return true.

Since equality comparison returns a boolean, we can omit the ternary expression on line 5.

=end

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8]) == true
p valid_series?([1, 12, 2, 5, 16, 6]) == false
p valid_series?([28, 3, 4, 7, 9, 14]) == false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3]) == true
p valid_series?([10, 6, 19, 2, 6, 4]) == false
