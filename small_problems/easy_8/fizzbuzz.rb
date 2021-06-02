# fizzbuzz.rb

def fizzbuzz(start, finish)
  answer = ''
  for i in start..finish
    case
    when (i % 3 == 0) && (i % 5 != 0) then answer.concat("Fizz, ")
    when (i % 3 != 0) && (i % 5 == 0) then answer.concat("Buzz, ")
    when (i % 3 == 0) && (i % 5 == 0) then answer.concat("FizzBuzz, ")
    else
      answer.concat("#{i}, ")
    end
  end
  answer.delete_suffix(", ")
end

p fizzbuzz(1, 15) == '1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz'
