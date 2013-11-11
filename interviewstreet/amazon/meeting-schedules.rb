=begin
# Passes 9 out of 10 test cases
# https://amazon.interviewstreet.com/challenges/dashboard/#problem/4fd651016cd04

Given M busy-time slots of N people, You need to print all the available time slots when all the N people can schedule a meeting for a duration of K minutes.
Event time will be of form HH MM ( where 0 <= HH <= 23 and 0 <= MM <= 59 ), K will be in the form minutes.

Input Format:

M K [ M number of busy time slots , K is the duration in minutes ]
Followed by M lines with 4 numbers on each line.
Each line will be of form StartHH StartMM EndHH EndMM  [ Example 9Am-11Am time slot will be given as 9 00 11 00 ]
An event time slot is of form [Start Time, End Time ) . Which means it inclusive at start time but doesn’t include the end time.
So an event of form 10 00  11 00 => implies that the meeting start at 10:00 and ends at 11:00, so another meeting can start at 11:00.

Sample Input:
5 120
16 00 17 00
10 30 14 30
20 45 22 15
10 00 13 15
09 00 11 00

Sample Output:
00 00 09 00
17 00 20 45

Sample Input:
8 60
08 00 10 15
22 00 23 15
17 00 19 00
07 00 09 45
09 00 13 00
16 00 17 45
12 00 13 30
11 30 12 30

Sample Output:
00 00 07 00
13 30 16 00
19 00 22 00

Constraints :
1 <= M <= 100

Note: 24 00 has to be presented as 00 00.

=end

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
