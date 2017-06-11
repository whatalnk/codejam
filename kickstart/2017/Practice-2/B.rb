T = gets.chomp.to_i

R_MAX = 3000
C_MAX = 3000
T.times do |cc|
  r, c, k = gets.chomp.split(' ').map(&:to_i)
  m = Array.new(r){Array.new(c, 0)}
  cumsum = Array.new(r+1){Array.new(c+1, 0)}
  k.times do
    ri, ci = gets.chomp.split(' ').map(&:to_i)
    m[ri][ci] = 1
  end
  r.times do |i|
    c.times do |j|
      cumsum[i+1][j+1] = m[i][j] + cumsum[i][j+1] + cumsum[i+1][j] - cumsum[i][j]
    end
  end
  ret = 0
  [r, c].min.times do |i|
    i += 1
    if i == 1 then # 1
      ret += (r * c - k)
    else
      (i..r).each do |row|
        (i..c).each do |col|
          n_monster = cumsum[row][col] - cumsum[row-i][col] - cumsum[row][col-i] + cumsum[row-i][col-i]
          if n_monster == 0 then
            ret += 1
          end
        end
      end
    end
  end
  # cumsum.each{|x| p x}
  puts "Case ##{cc+1}: #{ret}"
end
