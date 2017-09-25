# WA
t = gets.chomp.to_i
sq = (1..100).map{|x| x * x}

t.times do |c|
  n = gets.chomp.to_i
  nn = n
  ans = 0
  nums = []
  while n > 0
    i = sq.bsearch_index{|x| x > n}
    nums << sq[i - 1]
    n -= sq[i - 1]
    ans += 1
  end
  puts "Case ##{c + 1}: #{ans}"
end