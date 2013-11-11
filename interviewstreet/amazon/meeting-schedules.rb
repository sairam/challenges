
# Passes 9 out of 10 test cases
# https://amazon.interviewstreet.com/challenges/dashboard/#problem/4fd651016cd04

def find_sequences(a)
  prev = a[0]
  a.slice_before { |cur|
    prev, prev2 = cur, prev
    prev2 + 1 != prev
  }.to_a
end

today = (0..1440).to_a
arange = (0..1440).to_a
atimes, slot = gets.split(' ').map(&:to_i)

atimes.times do
  shr, smm, ehr, emm = gets.split(' ').map(&:to_i)
  start = shr*60+smm
   tend = ehr*60+emm-1

  today = today - arange[start..tend]
end

find_sequences(today).select{|x| x.count > slot-1}.each do |x|
  shr = (x[0])/60
  smm = (x[0])%60
  ehr = (x[-1]+1)/60
  ehr = 0 if ehr == 24
  emm = if ehr == 0
    x[-1]
  else
    x[-1]+1
  end % 60
  print "%02d" % shr
  print " %02d"% smm
  print " %02d"% ehr
  print " %02d" % emm
  puts
end
