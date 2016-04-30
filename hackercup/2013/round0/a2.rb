# ruby 2.0.0

def sol inp
  count = 0
  inp = inp.strip.gsub(/[a-z:]{2..}/,'').gsub(/[a-z]+/,'').gsub(' ','')
  while true
    count += 1
    break if count > 100
    if inp[0] == '(' and inp[-1] == ')'
      inp = inp[1..-2]
    elsif inp.size == 1
      if [')', '('].include?(inp[0])
        return 'NO'
      else
        return 'YES'
      end
    elsif inp[0] == ')'
      return 'NO'
    elsif (inp.scan('(').size != inp.scan(')').size)
      if inp.scan('(').size == 0 || inp.scan(')').size == 0
        inp = inp.gsub(/:[()]/,'')
      elsif inp.index(')') < inp.index('(')
        return 'NO'
      else
        'a'
      end
    elsif inp == ''
      break
    end
  end
  return 'YES'

end

gets.to_i.times do |i|
  ans = sol(gets)
  puts "Case ##{i+1}: #{ans}"
end

