# flintstones_names.rb

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

#Find the first name that begins with "Be", three different solutions.
flintstones.each_with_index do |name, index|
  p index if name.start_with?("Be")
end

p flintstones.index { |name| name.start_with?("Be") }

p flintstones.index { |name| name[0, 2] == "Be" }


# Shorten names to just the first three characters
flintstones.map! { |name| name = name[0, 3] }
p flintstones
