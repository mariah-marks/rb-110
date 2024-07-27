# Write a method that returns a UUID. Format: a string of hexadecimal characters `0-9`
# and `"a"-"f"`. A UUID has 5 sections, with character lengths: 8, 4, 4, 4 and 12.
# Sections are separated by a hyphen `-`.

# Ex:
# "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

def create_uuid
  chars = ("0".."9").to_a + ("a".."f").to_a
  sections = [8, 4, 4, 4, 12]

  sections.map! do |character_count|
    section = ""

    character_count.times do |_|
      section.concat(chars[rand(chars.length)])
    end
    section
  end
  sections.join("-")
end

create_uuid
