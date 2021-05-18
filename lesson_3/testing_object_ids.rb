# testing_object_ids.rb

a = h
obj_id_a_before_method = a.object_id

c = a
obj_id_c_before_method = c.object_id

def method(x)
  x + "w" # toggle between + and << to see effect
end

b =  method(a)
obj_id_a_after_method = a.object_id
obj_id_b_after_method = b.object_id
obj_id_c_after_method = c.object_id
puts "a is: #{a}, object_id before method is: #{obj_id_a_before_method} and object_id after method is: #{obj_id_a_after_method}"
puts "b is: #{b} and object_id after method is: #{obj_id_b_after_method}"