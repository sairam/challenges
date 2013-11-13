
# a + b + c = 1000
# a**2 + b**2 = c**2

# find a*b*c

# Euclid's formula - see http://en.wikipedia.org/wiki/Pythagorean_triple
# a = m**2 - n**2 ; b = 2 * m * n ; c = m**2 + n**2
# given a+b+c = 1000
# m**2+ 2*m*n + m**2 = 1000
# m(m+n) = 500


m,n = (1..(Math.sqrt(500).to_i)).to_a.reverse.map {|x| y = (500%x == 0 ? [x, 500/x - x] : nil) ; (y && (y[0] > y[1]) ? y : nil) }.compact[0]

a = m**2 - n**2
b = 2 * m * n
c = m**2 + n**2

puts a*b*c

