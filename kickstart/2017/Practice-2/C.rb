# Wrong answer

T = gets.chomp.to_i

def base_converter(n, base)
  ret = []
  while true
    rem = n % base
    ret << rem
    n /= base
    break if n == 0
  end
  return ret.reverse.join("")
end

T.times do |cc|
  n = gets.to_i
  ret = []
  (2..n).each do |b|
    s = base_converter(n, b)
    # p s.squeeze
    if s.squeeze == "1"
      ret << [s, b]
    end
  end
  ans = ret.sort_by{|x| x[0].length}
  puts "Case ##{cc+1}: #{ans.last[1]}"
end
