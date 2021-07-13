# pp16.rb

HEX = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def uuid
  id = ""
  8.times { id << HEX.sample }

  3.times do
    id << "-"
    4.times {id << HEX.sample }
  end

  id << "-"
  12.times { id << HEX.sample }

  id
end

p uuid