T = gets.chomp.to_i

T.times do |c|
  s = gets.chomp
  b = s.count('B')
  n = s.length
  i, j = gets.chomp.split(' ').map(&:to_i)
  i -= 1
  ni = i / n
  nj = j / n
  left = ni * b + s[0...(i - ni * n)].count('B')
  right = nj * b + s[0...(j - nj * n)].count('B')
  ret = right - left
  puts "Case ##{c+1}: #{ret}"
end
