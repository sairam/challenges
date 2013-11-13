require 'prime'

x = (1..2_000_000).lazy.with_object([0]).map{|x,y| x.prime? ? y[0]=y[0]+x : nil }.force.compact[-1]
puts x
