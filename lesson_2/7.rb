# On line 3, local variable `arr` is initialized to reference a new array object with two
# elements. The first element, `arr[0]`, is the same object being referenced by local variable
# `a`, the integer `2`. The second element, `arr[1]`, references an array object with the value 
# `[5, 8]`. 

# On line 5, we use element assignment to re-assign the value at `arr[0]` to the integer `4`.
# Although `[]=` is a mutating method, the re-assignment of `arr[0]` has no effect on the 
# object referenced by local variable `a`, because `a` isn't being referenced.

# In contrast, `b` is referenced by `arr[1]`, and element assignment mutates the array object
# referenced by `b` be re-assigning the element `b[0]`

# p a
# => 2

# p b
# => [3, 8]
