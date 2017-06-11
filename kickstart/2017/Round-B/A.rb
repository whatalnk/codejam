T = gets.chomp.to_i

X = 10**9 + 7
MAX_K = 10000 + 1
mpow = Array.new(MAX_K, 0)
mpow[0] = 1
(1..MAX_K).each do |i|
  mpow[i] = mpow[i-1] * 2 % X
end

T.times do |c|
  ret = 0
  n = gets.chomp.to_i
  k = gets.chomp.split(" ").map(&:to_i)
  n.times do |i|
    ((i+1)..(n-1)).each do |j|
      # curr = 2**(j - i - 1)
      curr = mpow[j - i - 1]
      ret += ((k[j] - k[i]) * curr) % X
      ret %= X
    end
  end
  puts "Case ##{c+1}: #{ret % X}"
end
