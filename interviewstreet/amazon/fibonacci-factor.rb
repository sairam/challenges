=begin
# https://amazon.interviewstreet.com/challenges/dashboard/#problem/4fd653336df28

Given a number K, find the smallest Fibonacci number that shares a common factor( other than 1 ) with it. A number is said to be a common factor of two numbers if it exactly divides both of them.

Output two separate numbers, F and D, where F is the smallest fibonacci number and D is the smallest number other than 1 which divides K and F.

Input Format

First line of the input contains an integer T, the number of testcases.
Then follows T lines, each containing an integer K.

Output Format

Output T lines, each containing the required answer for each corresponding testcase.





Sample Input

3
3
5
161

Sample Output

3 3
5 5
21 7

Explanation

There are three testcases. The first test case is 3, the smallest required fibonacci number  3. The second testcase is 5 and the third is 161. For 161 the smallest fibonacci numer sharing a common divisor with it is 21 and the smallest number other than 1 dividing 161 and 7 is 7.

Constraints :

1 <= T <= 5
2 <= K <= 1000,000
The required fibonacci number is guranteed to be less than 10^18.

=end

# FN = (1..Float::INFINITY).
#   lazy.
#   with_object([0,1]).
#   map { |x, last| last[1] = last[0] + (last[0] = last[1]) }.
#   take_while { |x| x < 1_000_000_000_000_000_000 }.force[1..-1]

FN = [2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711, 28657, 46368, 75025, 121393, 196418, 317811, 514229, 832040, 1346269, 2178309, 3524578, 5702887, 9227465, 14930352, 24157817, 39088169, 63245986, 102334155, 165580141, 267914296, 433494437, 701408733, 1134903170, 1836311903, 2971215073, 4807526976, 7778742049, 12586269025, 20365011074, 32951280099, 53316291173, 86267571272, 139583862445, 225851433717, 365435296162, 591286729879, 956722026041, 1548008755920, 2504730781961, 4052739537881, 6557470319842, 10610209857723, 17167680177565, 27777890035288, 44945570212853, 72723460248141, 117669030460994, 190392490709135, 308061521170129, 498454011879264, 806515533049393, 1304969544928657, 2111485077978050, 3416454622906707, 5527939700884757, 8944394323791464, 14472334024676221, 23416728348467685, 37889062373143906, 61305790721611591, 99194853094755497, 160500643816367088, 259695496911122585, 420196140727489673, 679891637638612258]
require 'prime'
def fibfac(k)
t = 0
x = k.prime_division.transpose[0].detect do |k1|
  t = FN.detect{|x| x % k1 == 0}
  t > 0
end
puts "#{t} #{x}"
end

gets.to_i.times do
  fibfac(gets.to_i)
end
