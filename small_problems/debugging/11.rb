=begin

The original array referenced by `arr` is output, because the `p` method invocation binds more tightly to it's argument than
the `do..end` block.

To resolve this, the argument to the `p` method call can be incased in parenthesis, or the block passed to the `sort`
method invocation can be re-written using curly brackets. Because the block is only one line, the second option is
be preferable.

=end

arr = ["9", "8", "7", "10", "11"]
p arr.sort { |x, y| y.to_i <=> x.to_i }

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]
