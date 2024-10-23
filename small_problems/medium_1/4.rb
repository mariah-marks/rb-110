=begin

Given an integer, return an array of lights that are "on" after that integer repetitions.
* the array includes numbers from 1 - the integer argument.
* the lights are initially off.
* on the first pass they are all switched to "on"
* on the second pass, the even values are turned "off"
* on the next pass, the even values
* the first light is always off
* the hash is modified on each round

Examples:
  n = 5 lights:
  round 1: { 1: on, 2: on, 3: on, 4: on, 5: on } # Multiples of 1 are toggled
  round 2: { 1: on, 2: off, 3: on, 4: off, 5: on } # Multiples of 2 are toggled
  round 3: { 1: on, 2: off, 3: off, 4: off, 5: on } # Multiples of 3 are toggled
  round 4: { 1: on, 2: off, 3: off, 4: on, 5: on } # Multiples of 4 are toggled
  round 5: { 1: on, 2: off, 3: off, 4: on, 5: off } # Multiples of 5 are toggled

  (1..n)
  1 % 1 = 0   -> 'on' |  1 % 2 = 0           |   1 % 3 = 0
  2 % 1 = 0   -> 'on' |  2 % 2 = 0  -> 'off' |   2 % 3 = 0
  3 % 1 = 0   -> 'on' |  3 % 2 = 0           |   3 % 3 = 0 -> 'off'

  n = 10 lights:
  round 10: {1: on, 2: off, 3: off, 4: on, 5: off, 6: off, 7: off, 8: off, 9: on, 10: off }

Data Structures:
- beginning: an integer representing the number of lights
- intermediate:
  - a hash, with each hash switch paired to the position on or off
- ending: an array of lights that are left "on"

Approach:
** Solution involves nested iteration
  - Compare each light [1..n] to the values in (1..n)
    - If the light # is a multiple of n, convert switch to opposite position.

Algorithm:
* given an integer `n`
1. create a collection with each number from 1 to `n`
  - Initialize a hash with keys (1..n)
    - set each key to 'off'
2. toggle lights up to `n` rounds
  - Iterate over a collection 1..n
    - for each factor:
      - set hash key value to opposite the current position if it is a multiple of factor
        - evaluate if key is a multiple of factor
          if yes:
          - evaluate switch position
            - convert to "off" if switch is on
            - otherwise, convert to "on"
3. return the number of lights set to 'on'
  - return an array of keys which reference the value 'on'

=end

def multiple_of_current_number?(key, factor)
  (key % factor).zero?
end

def toggle_switch(lights_hash, light)
  new_position = (lights_hash[light] == 'on' ? 'off' : 'on')
  lights_hash[light] = new_position
end

def toggle_lights(number_of_lights)
  lights_hash = (1..number_of_lights).each_with_object({}) { |key, hash| hash[key] = 'off' }

  (1..number_of_lights).each do |factor|
    lights_hash.each_key do |key|
      toggle_switch(lights_hash, key) if multiple_of_current_number?(key, factor)
    end
  end

  lights_hash.select { |_, value| value == 'on' }.keys
end

p toggle_lights(5) == [1, 4]
p toggle_lights(10) == [1, 4, 9]
p toggle_lights(15) == [1, 4, 9]
p toggle_lights(100) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
p toggle_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121,
                          144, 169, 196, 225, 256, 289, 324, 361, 400,
                          441, 484, 529, 576, 625, 676, 729, 784, 841,
                          900, 961]
