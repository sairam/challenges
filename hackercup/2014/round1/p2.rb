# ruby 2.0.0

def sol n,k,c
  if n < k
    if k%n == 0
      c
    elsif k == c
      s = (k/(n*1.0)).ceil
      # n - k/s + c
      (s..k).map do |x|
        v = n - k/x
        v >= 0 ? v : nil
      end.compact.sort[0] + c
    else
      s = (k/(n*1.0)).ceil
      (s..k).map do |x|
        v = n - k/x
        v >= 0 ? v : nil
      end.compact.sort[0] + c
    end
  elsif n > k
    # case 2
    n - k + c
  else # n == k
    c
  end
end

gets.to_i.times do |i|
  x = gets.split.map(&:to_i)
  ans = sol x[0], x[1], x[2]
  puts "Case ##{i+1}: #{ans}"
end
