# ruby 2.0.0

def sol inp
  countdown = 26
  inp.downcase.scan(/[a-z]/).group_by{|x| x}.sort_by{|_,x| -x.size}.map do |v|
    countdown -= 1
    v[1].size * (countdown+1)
  end.inject(:+)
end

gets.to_i.times do |i|
  ans = sol(gets)
  puts "Case ##{i+1}: #{ans}"
end
