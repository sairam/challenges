require 'prime'

# puts (1..200000).lazy.with_object([0]).map{|x,y| x.prime? ? y[0]=y[0]+1 : 0 ; (y[0] == 10001 ? x : nil) }.force.compact[0]

answer = (1..Float::INFINITY).lazy.select{|x| x.prime? }.take(10001).force[-1]
puts answer
