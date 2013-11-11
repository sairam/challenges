=begin

# 7 / 10 test cases pass
# https://amazon.interviewstreet.com/challenges/dashboard/#problem/4fd648244715d

Given a paragraph of text, write a program to find the first shortest sub-segment that contains each of the given k words at least once. A segment is said to be shorter than other if it contains less number of words.

Ignore characters other than [a-z][A-Z] in the text. Comparison between the strings should be case-insensitive.

If no sub-segment is found then the program should output “NO SUBSEGMENT FOUND”.


Input format :

First line of the input contains the text.
Next line contains k , the number of  words given to be searched.
Each of the next k lines contains a word.


Output format :

Print first shortest sub-segment that contains given k words , ignore special characters, numbers.If no sub-segment is found it should return “NO SUBSEGMENT FOUND”

Sample Input :

This is a test. This is a programming test. This is a programming test in any language.
4
this
a
test
programming

Sample Output :

a programming test This

Explanation :
In this test case segment "a programming test. This" contains given four words. You have to print without special characters, numbers so output is "a programming test This".  Another segment "This is a programming test." also contains given  four words but have more number of words.

Constraint :

Total number of character in a paragraph will not be more than 200,000.
0 < k <= no. of words in paragraph.
0 < Each word length < 15

=end

orig_str = gets
input_str = orig_str.scan(/[A-z]+/)
size = gets.to_i
query_str = size.times.map{gets}.map(&:strip).map(&:downcase).sort.uniq
asize = query_str.size
begin
  unless (input_str.map(&:downcase) & query_str).size == asize
    raise "NO SUBSEGMENT FOUND"
  end

  xinput_str = input_str.map(&:downcase)
  loffset = query_str.map do |q|
    xinput_str.index(q)
  end.sort[0]
  roffset = query_str.map do |q|
    xinput_str.rindex(q)
  end.sort[-1]
  # trimming down input size
  input_str = input_str[loffset..roffset]
  tsize = input_str.size

  (asize..tsize).each do |osize|
    (tsize-osize+1).times do |i|
      # puts "[#{osize}]"+input_str[i..(i+osize-1)].join(' ')
      if (input_str[i..(i+osize-1)].map(&:downcase) & query_str).size == asize
        # raise "works #{i} with #{osize} yay- #{input_str[i..(i+osize-1)]}"
        raise input_str[i..(i+osize-1)].join(' ')
      end

    end
  end
rescue Exception => e
  puts e
end
