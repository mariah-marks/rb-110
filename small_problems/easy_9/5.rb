=begin

Problem:
- Given a name, return a new string with the first and last names reversed.
* names are separated by a comma.

Examples:
  Joe Roberts == 'Roberts, Joe'

Data Structures:
- beginning: string
- intermediate: two-element array of strings
- ending: string

Algorithm:
- convert string to array with first and last names
- reverse the array
- convert to a string, with words separated by a comma.

=end

def swap_name(name)
  name.split.reverse.join(", ")
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
