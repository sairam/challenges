# ruby 2.0.0

def sol(inp, inp2)
  n,k = inp.split.map(&:to_i)
  a,b,c,r = inp2.split.map(&:to_i)
  m = []
  m[0] = a
  (1..(k-1)).each do |i|
    m[i] = (b * m[i - 1] + c) % r
  end
  (0..(n-k-1)).each do |i|
    m[k+i] = (0..Float::INFINITY).lazy.select{|x| !m[i..k+i].include?(x)}.first
  end
  m[-1]
end

gets.to_i.times do |i|
  ans = sol(gets, gets)
  puts "Case ##{i+1}: #{ans}"
end

