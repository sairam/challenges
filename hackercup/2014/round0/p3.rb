# ruby 2.0.0
require 'pry'
=begin
  wins with probability of ps when sunny
  wins with probability of pr when rainy
  chance for sun to be present is pi
  when wins a set
  pu with probability of pw
  when loses a set
  pd with probability of pl


  winning wset1 = ps*pi + pr*(1-pi)
  1. prob of sun * winning chance when sun is present
  2. prob of rain * winning chance when rain is present

  winning 1st set after losing -
  2. losing wset1 *
    2.1 ((pi-pd*pl) + pl*(1-pd))*ps
    2.2 (1 - (pi+pd*pl) - pi*(1-pl))*pr
  0.264

  winning set2 after losing once
    wset

  2 0.600 0.200 0.500 0.100 1.000 0.100 1.000
  Case #2: 0.352000

=end

def sol inp
  k, ins = inp.split(' ',2)
  k = k.to_i
  ps, pr, pi, pu, pw, pd, pl = ins.split.map(&:to_f)

  @ps = ps
  @pr = pr
  @pu = pu
  @pw = pw
  @pd = pd
  @pl = pl

  #
  # required_wins = 2
  # # winning 1st set
  # first_set = ps*pi + pr*(1-pi)
  # # winning 2nd set
  # first_set * winning_another_set + (1-first_set)*winning_another_set
  #
  # required_wins.times do |i|
  #   count = 0
  #   while count <= i
  #     wins[i] = win_scene(pi,ps,pr, count)
  #     count+=1
  #     break if count == i
  #     lose_scene(pi,ps,pr, pr,count)
  #   end
  # end

  # winning second set after winning first + winning second set after winning one
  # wins[0]*win_scene(pi,ps,pr) + (1-wins[0])*lose_scene(pi,ps,pr)

  def win_scene(pi,round,required_wins,current_wins)
    return 0 if round >= required_wins
    # puts "w #{' '*round},#{required_wins},#{current_wins})"
    sunny = (round == 0) ? pi : (pi+(@pu*@pw))
    sunny = 1.0 if sunny > 1
    sunny = 0.0 if sunny < 0
    chance = sunny*@ps + (1-sunny)*@pr
    binding.pry if chance > 1

    if required_wins == current_wins+1
      chance
    else
      # return 0 if round > 100
      return 0 if (10**7*chance).to_i < 1
      wins = win_scene(sunny,round+1,required_wins,current_wins+1)
      # lose = lose_scene(sunny,round+1,required_wins,current_wins+1)
      chance * (wins)#+ (1-chance)*lose
    end
  end

  def lose_scene(pi,round,required_wins,current_wins)
    return 0 if round >= required_wins
    # puts "l #{' '*round},#{required_wins},#{current_wins})"
    sunny = (round == 0) ? pi : (pi-(@pd*@pl))
    sunny = 1.0 if sunny > 1
    sunny = 0.0 if sunny < 0
    chance = sunny*@ps + (1-sunny)*@pr
    binding.pry if chance > 1

    if required_wins == current_wins
      chance
    else
      # return 0 if round > 100
      return 0 if (10**7*chance).to_i < 1
      wins = win_scene(sunny,round+1,required_wins,current_wins+1)
      # lose = lose_scene(sunny,round+1,required_wins,current_wins+1)
      chance * (wins) #+ (1-chance)*lose
    end
  end

  # a = win_scene(pi,0,1,0)
  b = win_scene(pi,0,k,0)
  c = lose_scene(pi,0,k,0)
  # c = (k > 1) ? lose_scene(pi,1,k,0) : 0

  puts b
  puts c
  b +c
  # wtf?
  # 0.4* win_scene(pi,0,k,0)+ (1-0.6)*lose_scene(pi,0,k,0)

#   def smth(pi, ps, pr, setcount=0)
#     arr[1] = arr[0]
#   end
#   # set 2+ ?
#   set2 = ((ps+pu)*pw + ps*(1-pw))*pi
#   (1-set1)*((ps-pd)*pl + ps*(1-pl))
#   if k > 1
#     (k-1).times do
#
#     end
#   end
end

gets.to_i.times do |i|
  ans = sol(gets)
  puts "Case ##{i+1}: %1.6f"%ans
end
