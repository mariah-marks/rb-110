=begin

Problem:
Given an array an a hash, return a string with the values interpolated.
* The array has at least two elements, but not more than 3.
* the hash has two keys: (job) title and occupation.

Examples:
['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }
=> "Hello, John Q Doe! Nice to have a Master Plumber around."

Data Structures:
- beginning: array and hash
- ending: a string

Algorithm:
- SET middle to a default value of ""
       first to first element in name array
       last to last element in name array
       middle to element at index 1 if array has more than 2 elements
- Create a string, with name values and hash values interpolated
- RETURN the string

=end

def greetings(name, work)
  first, last = name[0], name[-1]
  middle = name[1] if name.length > 2
  title, job = work[:title], work[:occupation]
  
  "Hello, #{first} #{middle} #{last}! Nice to have a #{title} #{job} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."
