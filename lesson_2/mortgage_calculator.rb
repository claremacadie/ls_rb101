# mortgage_calculator.rb

require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(message)
  puts("=> #{message}")
end

def valid_integer?(number)
  number.to_i.to_s == number
end

def remove_trailing_zeros(number)
  while number[-1] == "0" && number.length > 1
    number.chop!
  end
end

def valid_float?(string)
  return false if string.include?('.') == false
  separated_number = string.split(".")
  return false if separated_number.size > 2
  fractional = separated_number[1]
  remove_trailing_zeros(fractional)
  float = separated_number[0] + "." + fractional
  float.to_f.to_s == float
end

def valid_loan_amount?(number)
  (number.to_i.positive? || number.to_f.positive?) &&
    (valid_integer?(number) ||
    (valid_float?(number) && number.split('.')[1].size < 3))
end

def get_loan_amount
  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = gets.chomp.gsub(',', '').gsub('£', '')
    return loan_amount if valid_loan_amount?(loan_amount)
    prompt(MESSAGES['valid_loan_amount'])
  end
end

def get_apr
  loop do
    prompt(MESSAGES['apr'])
    apr = gets.chomp
    return apr if apr.to_f >= 0 && (valid_integer?(apr) || valid_float?(apr))
    prompt(MESSAGES['valid_apr'])
  end
end

def get_loan_duration
  loop do
    prompt(MESSAGES['loan_duration'])
    loan_duration_years = gets.chomp
    return loan_duration_years if loan_duration_years.to_f > 0 &&
                                  (valid_integer?(loan_duration_years) ||
                                  valid_float?(loan_duration_years))
    prompt(MESSAGES['valid_loan_duration'])
  end
end

def convert_apr_to_monthly_rate(apr)
  apr.to_f / 1200
end

def convert_loan_duration_to_months(loan_duration_years)
  loan_duration_years.to_f * 12
end

def calc_mthly_payments(loan_amount, mthly_rate, loan_dur_mths)
  if mthly_rate == 0
    loan_amount.to_i / loan_dur_mths
  else
    loan_amount.to_i *
      (mthly_rate / (1 - (1 + mthly_rate)**(-loan_dur_mths)))
  end
end

def display_monthly_payment(monthly_payment)
  puts "Your monthly repayments will be: £#{format('%.2f', monthly_payment)}."
end

def display_calculating
  prompt(MESSAGES['calculating'])
  sleep(2)
end

def ask_another_calculation
  prompt(MESSAGES['another_calculation'])
  gets.chomp
end

system('clear')
prompt(MESSAGES['welcome'])
loop do
  loan_amount = get_loan_amount
  apr = get_apr
  loan_duration_years = get_loan_duration
  mthly_rate = convert_apr_to_monthly_rate(apr)
  loan_dur_mths = convert_loan_duration_to_months(loan_duration_years)
  monthly_payment = calc_mthly_payments(loan_amount, mthly_rate, loan_dur_mths)
  display_calculating
  display_monthly_payment(monthly_payment)
  puts
  answer = ask_another_calculation
  break unless answer.downcase == 'y'
  system('clear')
end
prompt(MESSAGES['goodbye'])
