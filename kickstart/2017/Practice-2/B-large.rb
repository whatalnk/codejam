# Ref: solution by Benq
T = gets.chomp.to_i

R_MAX = 3000
C_MAX = 3000
T.times do |cc|
  r, c, k = gets.chomp.split(' ').map(&:to_i)
  m1 = Array.new(r+1){Array.new(c+1, 0)}
  m2 = Array.new(r+1){Array.new(c+1, 0)}
  k.times do
    ri, ci = gets.chomp.split(' ').map(&:to_i)
    m1[ri][ci] = 1
  end
  ret = 0
  (r-1).downto(0) do |i|
    (c-1).downto(0) do |j|
      if m1[i][j] == 0 then
        m2[i][j] = [[m2[i+1][j], m2[i][j+1]].min, m2[i+1][j+1]].min + 1
        ret += m2[i][j]
      end
    end
  end
  puts "Case ##{cc+1}: #{ret}"
end
