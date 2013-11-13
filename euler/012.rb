require 'prime'
COUNT_OF_DIVISORS = 500
# prev_c = 0
a = (2..Float::INFINITY).lazy.select do |x|

  n = (x*(x+1))/2
  # no of divisors from - http://stackoverflow.com/a/9183106/208928
  c = (2..(n**0.5).to_i).select{|x| n % x == 0 }.count
  # if prev_c < c
  #   prev_c = c
  #   puts "n - #{n}, x - #{x}, c - #{c}"
  # end
  c >= COUNT_OF_DIVISORS/2

  # pd= n.prime_division.map{ |pd| (0..pd[1]).map{ |i| pd[0]** i } }
  # x = (pd.length== 1 ? pd[0] : pd[0].product(*pd.drop(1)).map{ |a, b| a* b })[0..-2].uniq
  # x.size >= 500

end

puts a.take(1).force

# counting factors - (1..(10**0.5).to_i).map{|x| 10%x == 0}
