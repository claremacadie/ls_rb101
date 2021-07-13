# pp5.rb

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index {|name| name.start_with?("Be")}

flintstones.map! {|name| name[0, 3] }

p flintstones
