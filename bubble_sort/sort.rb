require 'pry'

array = Array.new(10) { rand(1..1000) }
puts array.join(', ')

def bubble_sort(array)
  switch = true
    while switch
      switch = false
      (array.length - 1).times do |i|
        if array[i] > array[i + 1]
          array[i], array[i + 1] = array[i + 1], array[i]
          switch = true
        end
      end
      puts array.join(', ')
    end
  puts array.join(', ')
end

bubble_sort(array)