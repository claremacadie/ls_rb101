# stack_machine.rb

STACK_OPERATORS = %w(ADD SUB MULT DIV MOD POP)
REGISTER_OPERATORS = %w(PUSH PRINT)

def minilang(str)
  register = 0
  stack = []
  error_codes = {printed: false, register: false, stack: false}
  instructions = str.split(' ')

  instructions.each do |instruction|
    if instruction.to_i.to_s == instruction
      register = instruction.to_i
      error_codes[:register] = true

    elsif STACK_OPERATORS.include?(instruction)
      if stack.empty?
        puts "Stack is empty."
      elsif error_codes[:register] == false
        puts "Register is empty."
      elsif instruction == "ADD"
        register += stack.pop
      elsif instruction == "SUB"
        register -= stack.pop
      elsif instruction == "MULT"
         register *= stack.pop
      elsif instruction == "DIV"
        register /= stack.pop
      elsif instruction == "MOD"
        register %= stack.pop
      elsif instruction == "POP"
        register = stack.pop
      end

    elsif REGISTER_OPERATORS.include?(instruction)
      if error_codes [:register] == false
        return "Register is empty"
      elsif instruction           == "PUSH"
        stack.push(register)
        error_codes[:stack] = true
      elsif instruction           == "PRINT"
        p register
        error_codes[:printed] = true
      end

    else
      p "Error, #{instruction} is not a valid instruction."
    end
  end

  puts "no PRINT commands" if error_codes[:printed] == false
end

minilang('5 MULT')
puts

p 'next'
minilang('3 PUSH 5 MOD PUSH 4 PUSH 5 MULT PUSH 7 PUSH 3 SUB ADD DIV PRINT')
puts

p 'next'
minilang('PRINT')
# 0
puts

p 'next'
minilang('5 PUSH 3 MULT PRINT')
# 15
puts

p 'next'
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts

p 'next'
minilang('5 PUSH POP PRINT')
# 5
puts

p 'next'
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts

p 'next'
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts

p 'next'
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts

p 'next'
minilang('-3 PUSH 5 SUB PRINT')
# 8
puts

p 'next'
minilang('6 PUSH')
# (nothing printed; no PRINT commands)
puts

p 'next'
minilang('PUSH')

p 'done'
