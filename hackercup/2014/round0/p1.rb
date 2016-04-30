# ruby 2.0.0

def sol inp

  return 'YES' if inp.size == 1 && inp[0] == '#'

  d = inp.map{|x| x.scan(/#+/) }
  return 'NO' unless (d.map{|x| x.size}.uniq - [0] == [1])

  e = d.map{|x| !x[0].nil? ? x[0].size : nil}.compact
  return 'NO' unless e.uniq.size == 1
  return 'NO' unless e.uniq[0] == e.size
  f = inp.map{|x| [x.index('#'), x.rindex('#')] }.select{|x| x[0]!=nil }
  return 'NO' unless e.uniq[0] == e.size
  return 'YES' if f.uniq.size == 1
  return 'NO'
end

gets.to_i.times do |i|
  ans = sol (0..(gets.to_i-1)).map{gets.strip}
  puts "Case ##{i+1}: #{ans}"
end