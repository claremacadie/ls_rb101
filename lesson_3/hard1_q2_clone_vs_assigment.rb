# hard1_q2_clone_vs_assigment.rb

greetings = { a: 'hi' }
obj_id_greetings_before = greetings.object_id
obj_id_greetings_symbol_a_before = greetings[:a].object_id

# toggle the next two lines to see the difference between cloning and assignment
#informal_greeting = greetings[:a]
informal_greeting = greetings[:a].clone

obj_id_greetings_after = greetings.object_id
obj_id_greetings_symbol_a_after = greetings[:a].object_id

informal_greeting << ' there'
obj_id_informal_greeting = informal_greeting.object_id

puts "Informal greeting is: #{informal_greeting}, obj_id: #{obj_id_informal_greeting}"
puts "greetings is: #{greetings}, obj_id_before: #{obj_id_greetings_before} and obj_id_after: #{obj_id_greetings_after}"
puts "greetings[:a] is: #{greetings[:a]}, obj_id_before: #{obj_id_greetings_symbol_a_before} and obj_id_after: #{obj_id_greetings_symbol_a_after}"