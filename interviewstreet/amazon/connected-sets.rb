
# https://amazon.interviewstreet.com/challenges/dashboard/#problem/4fd6570bd51e1

def findc cells, loc
  return nil unless loc
  cells[loc]
end

def north(i,j,size)
  x = ((i-1)*size)+j
  x<0 ? nil : x
end
def south(i,j,size)
  x = ((i+1)*size)+j
  x<0 ? nil : x
end

def east(i,j,size)
  x = j+1
  x >= size ? nil : (i*size)+x
end

def west(i,j,size)
  x = j-1
  x < 0 ? nil : (i*size)+x
end

def findx(count,size)
  count/size
end
def findy(count,size)
  count%size
end

def neast(i,j,size)
  n = north(i,j,size)
  e = east(i,j,size)
  if n && e
    findx(n,size)*size + findy(e,size)
  else
    nil
  end
end

def nwest(i,j,size)
  n = north(i,j,size)
  w = west(i,j,size)
  if n && w
    findx(n,size)*size + findy(w,size)
  else
    nil
  end
end

def seast(i,j,size)
  s = south(i,j,size)
  e = east(i,j,size)
  if s && e
    findx(s,size)*size + findy(e,size)
  else
    nil
  end
end

def swest(i,j,size)
  s = south(i,j,size)
  w = west(i,j,size)
  if s && w
    findx(s,size)*size + findy(w,size)
  else
    nil
  end
end

class Cell
  attr_accessor :n, :e, :w, :s, :ne, :nw, :se, :sw, :touched, :val

  def initialize(val)
    self.val = val
    self.touched = false
  end

  def find_connected_cells
    return false if self.touched == true
    self.touched = true
    return false if self.val == 0

    %w{n s e w ne nw se sw}.each do |dir|
      c = self.send(dir)
      c.find_connected_cells if c && c.touched != true && c.val != 0
    end
    return true
  end

end

def make_matrix(size, input)
  cells = input.map{|x| Cell.new(x) }
  size.times do |i|
    size.times do |j|
      loc = i*size+j
      cells[loc].n  = findc cells, north(i,j,size)
      cells[loc].s  = findc cells, south(i,j,size)
      cells[loc].e  = findc cells,  east(i,j,size)
      cells[loc].w  = findc cells,  west(i,j,size)
      cells[loc].ne = findc cells, neast(i,j,size)
      cells[loc].nw = findc cells, nwest(i,j,size)
      cells[loc].se = findc cells, seast(i,j,size)
      cells[loc].sw = findc cells, swest(i,j,size)
    end
  end

  count = 0
  cells.each do |c|
    count+=1 if c.find_connected_cells
  end

  puts count
end

=begin
input = %{
  0 0 1 0 0 1 0 0
  1 0 0 0 0 0 0 1
  0 0 1 0 0 1 0 1
  0 1 0 0 0 1 0 0
  1 0 0 0 0 0 0 0
  0 0 1 1 0 1 1 0
  1 0 1 1 0 1 1 0
  0 0 0 0 0 0 0 0
}.split.map(&:to_i)

size = 8
=end

gets.to_i.times do
  x = gets.to_i
  input = (1..x).map { gets }.flatten.join.split.map(&:to_i)
  make_matrix(x,input)
end
