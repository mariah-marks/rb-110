=begin

Create a stack-and-register language method.
* The method uses a stack or collection of values
* Each operation is made using the current value (register)
  - The register is nt part of the stack
* POP, ADD, SUB, MULT, DIV, MOD all remove an element from the stack
  - the register is assigned to the solution
* PUSH adds a value to the stack
* n adds a value to the register
* PRINT outputs the register value

Examples:
  minilang('PRINT')
    register = 0
    # 0

  minilang('5 PUSH 3 MULT PRINT')
    5 -> register = 5
    PUSH -> stack = [5]
    3 -> register = 3
    MULT -> 3 * 5 = 15
    register = 15
    stack = [
    print register

  minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
  # 5
  # 3
  # 8

  minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
  # 6

  minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
  # 12

  minilang('-3 PUSH 5 SUB PRINT')
  # 8

Data Structure:
- input: a string of integer values and commands
- intermediate:
  - a hash with operators as values, commands as keys

- output: an integer

** Values entered as a string:
  - split into array elements
    - "5", "PUSH", "3", "MULT", "PRINT"
    - if value is integer,
      - store as current_value
      - perform the next command
    - Skip next command

Algorithm:
1. Create a variable representing the current value
  - Initialize register to 0
2. Create a hash with operations as keys and operators as values
3. Convert number strings to integers
- Create a new array of values
  - iterate over the array
    - if value is an integer, return integer to new array
      - inputs_array
    - otherwise return value to new array
      - inputs_array
4. Iterate over inputs_array
  - if element equals `PRINT`
    - output value in register
  - if element equals 'POP'
    - remove last value in stack
    - assign value to register
  - if element is  `PUSH`
    - append register value to stack
  - if element equals key from operations hash
    - perform the operation
  - Else set value to register
  - return register

=end

OPERATIONS = { 'ADD' => :+, 'SUB' => :-, 'MULT' => :*, 'DIV' => :/, 'MOD' => :% }.freeze

def convert_tokens(input_string)
  input_string.split.map { |token| token.to_i.to_s == token ? token.to_i : token }
end

def interpret_tokens(inputs_array, register = 0, stack = [])
  inputs_array.each do |token|
    next register = [stack.pop].inject(register, OPERATIONS[token]) if OPERATIONS.include?(token)

    case token
    when 'PRINT' then puts register
    when 'POP' then register = stack.pop
    when 'PUSH' then stack << register
    else register = token
    end
  end
  register
end

def minilang(input_string)
  tokens_array = convert_tokens(input_string)
  interpret_tokens(tokens_array)
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
