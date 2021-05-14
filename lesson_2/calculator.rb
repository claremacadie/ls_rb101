# calculator.rb

# add link to yaml file for messages to user
require 'yaml'
# MESSAGES is a hash created from information in the .yml file
# the keys are titles of messages and the values are the messages
# e.g. {"welcome" => "Welcome to Calculator!"}
MESSAGES = YAML.load_file('calculator_messages.yml')

# method to standardise output messages to user
def prompt(message)
  Kernel.puts("=> #{message}")
end

# method to determine if a number entered as a string is really a number
def valid_number?(number)
  number.to_i.to_s == number || number.to_f.to_s == number
end

# method to convert user input for operation to a verb to use in output message
# case is assigned to a variable (word) to make the code more robust, rather
# than relying on implicit return, word is placed at the end to ensure word is
# returned
def operation_to_message(op)
  word = case op
         when '1'
           'Adding'
         when '2'
           'Subtracting'
         when '3'
           'Multiplying'
         when '4'
           'Dividing'
         end
  word
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''

  # ask the user for two numbers
  loop do
    prompt(MESSAGES['first_number'])
    number1 = Kernel.gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number2 = ''

  loop do
    prompt(MESSAGES['second_number'])
    number2 = Kernel.gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  # ask the user for an operation to perform
  prompt(MESSAGES['operations'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['valid_option'])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers ...")

  # perform the operation on the two numbers
  result = case operator
           when '1'
             number1.to_i() + number2.to_i()
           when '2'
             number1.to_i() - number2.to_i()
           when '3'
             number1.to_i() * number2.to_i()
           when '4'
             number1.to_f() / number2.to_f()
           end

  # output the result
  prompt("The result is #{result}")

  prompt(MESSAGES['another_calculation'])
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt(MESSAGES['goodbye'])
