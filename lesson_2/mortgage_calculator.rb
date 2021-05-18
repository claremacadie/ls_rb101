# mortgage_calculator.rb

# method to standardise output messages to user
def prompt(message)
  puts("=> #{message}")
end

# method to determine if a number entered as a string is a valid integer
def valid_integer?(number)
  number.to_i.to_s == number
end

# method to determine if a number entered as a string is a valid float
def valid_float?(number)
  number.to_f.to_s == number
end

# method to obtain loan amount from user
def get_loan_amount
  loop do
    prompt(MESSAGES['loan_amount'])
    loan_amount = gets.chomp.gsub(',', '').gsub('£', '')
    return loan_amount if (loan_amount.to_f > 0 || loan_amount.to_i > 0) &&
                          (valid_integer?(loan_amount) ||
                          valid_float?(loan_amount))
    prompt(MESSAGES['valid_loan_amount'])
  end
end

# method to obtain APR from user
def get_apr
  loop do
    prompt(MESSAGES['apr'])
    apr = gets.chomp
    return apr if apr.to_f >= 0 && (valid_integer?(apr) || valid_float?(apr))
    prompt(MESSAGES['valid_apr'])
  end
end

# method to obtain loan duration from user
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

# method to convert apr to monthly interest rate
def convert_apr_to_monthly_rate(apr)
  apr.to_f / 1200
end

# method to convert loan duration to months
def convert_loan_duration_to_months(loan_duration_years)
  loan_duration_years.to_f * 12
end

# method to calculate monthly payments
def calc_mthly_payments(loan_amount, mthly_rate, loan_dur_mths)
  if mthly_rate == 0
    m = loan_amount.to_i / loan_dur_mths
  else
    m = loan_amount.to_i *
        (mthly_rate / (1 - (1 + mthly_rate)**(-loan_dur_mths)))
  end
  m.round(2)
end

# method to display monthly payment
def display_monthly_payment(monthly_payment)
  puts "Your monthly repayments will be: £#{monthly_payment}"
end

# method to display calculating
def display_calculating
  prompt(MESSAGES['calculating'])
  sleep(2)
end

# method to ask if user would like another calculation
def ask_another_calculation
  prompt(MESSAGES['another_calculation'])
  gets.chomp
end

# main program
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
  answer = ask_another_calculation
  break unless answer.downcase == 'y'
  system('clear')
end
prompt(MESSAGES['goodbye'])
