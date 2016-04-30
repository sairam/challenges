# ruby 2.0.0

def sol str, nth_box
  nth_box = nth_box.to_i
  len = str.length
  if len == 1
    str * nth_box
  else
    current_combinations = 0
    sum = 0
    (1..100).lazy.each do |k|
      y= len ** k
      if sum+y >= nth_box
        current_combinations = k
        break
      else
        sum += y
      end
    end
    current_combinations
    cc = (nth_box - sum - 1)
    a = ""
    conv = cc.to_s(len)
    if current_combinations - conv.length > 0
      a+= str[0]* (current_combinations - conv.length)
    end
    conv.each_char do |x|
      a+=str[x.to_i(len)]
    end
    a
  end
end

gets.to_i.times do |i|
  x = gets.split
  ans = sol x[0], x[1]
  puts "Case ##{i+1}: #{ans}"
end