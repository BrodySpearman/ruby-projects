require 'pry'

puts "Enter a word or phrase to encrypt:"
string = gets.chomp

puts "Enter a number to shift by:"
number = gets.chomp.to_i

def caesar_cipher(string, number)
  ord = string.chars.map { |ch| ch.ord }
  # shifts the characters based on their ascii num.
  shift = ord.map do |num|
    if num.between?(65, 90)
      ((num - 65 + number) % 26) + 65
    elsif num.between?(97, 122)
      ((num - 97 + number) % 26) + 97
    else  
      num  
    end
  end
  # brings characters back to a string.
  final = shift.map { |i| i.chr }.join("")
  puts final
end

caesar_cipher(string, number)