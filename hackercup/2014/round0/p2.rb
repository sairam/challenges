# ruby 2.0.0

def sol inp, inp1
  n,m,p = inp
  # y[3] is player rank
  players = inp1.map{|x| y = x.split ; y[1] = y[1].to_i ;  y[2] = y[2].to_i ; y[3] = nil ; y[4] = 0; y[5] = false; y}
  players.sort!{|x,y| t = (x[1] <=> y[1]) ; r = (t == 0 ? (x[2] <=> y[2]) : t) ; -r  }
  players.each_with_index {|x,i| x[3] = i+1}
  team_a = players.select{|x| x[3] %2 == 1}.sort{|x,y| x[3] <=> y[3]}
  team_b = players.select{|x| x[3] %2 == 0}.sort{|x,y| x[3] <=> y[3]}
  team_a.each_with_index{|x,i| x[5] = true if i < p }
  team_b.each_with_index{|x,i| x[5] = true if i < p }

  m.times do
    team_a.each_with_index{|x,i| x[4]+=1 if i < p }
    sub_out = team_a[0..(p-1)].sort{|x,y| t = (x[4] <=> y[4]) ; r = (t == 0 ? x[3] <=> y[3] : t) ; r  }[-1]
    sub_out[5] = false
    sub_in = team_a.select{|x| x[5] == false }.sort{|x,y| t = (x[4] <=> y[4]) ; r = (t == 0 ? x[3] <=> y[3] : t) ; r  }[0]
    sub_in[5] = true
    team_a.sort_by!{|x| x[5] == true ? -1 : 0 }
    # team_a.each_with_index{|x,i| x[5] = true if i < p }

    team_b.each_with_index{|x,i| x[4]+=1 if i < p }
    sub_out = team_b[0..(p-1)].sort{|x,y| t = (x[4] <=> y[4]) ; r = (t == 0 ? x[3] <=> y[3] : t) ; r  }[-1]
    sub_out[5] = false
    sub_in = team_b.select{|x| x[5] == false }.sort{|x,y| t = (x[4] <=> y[4]) ; r = (t == 0 ? x[3] <=> y[3] : t) ; r  }[0]
    sub_in[5] = true
    team_b.sort_by!{|x| x[5] == true ? -1 : 0 }
  end

  (team_a.take(p).map{|x| x[0]} | team_b.take(p).map{|x| x[0]}).sort.join(' ')

end

gets.to_i.times do |i|
  data = gets.split.map(&:to_i)
  pdata = (1..data[0]).map{gets.strip}
  ans = sol(data, pdata)
  puts "Case ##{i+1}: #{ans}"
end