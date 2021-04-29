require 'pry'

def fibs(n)
  a = 0
  b = 1

  n.times do
    temporary = a
    a = b
    b = temporary + b
  end

  puts a
end

def recursive_fibs(n)
  n <= 1 ? n : recursive_fibs(n - 2) + recursive_fibs(n - 1)
end

n = gets.chomp.to_i
recursive_fibs(n)