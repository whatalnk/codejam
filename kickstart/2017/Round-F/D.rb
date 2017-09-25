# AC
t = gets.chomp.to_i
sq = (1..10000).map{|x| x*x}
t.times do |c|
  n = gets.chomp.to_i
  a = (0..n).to_a
  (1).upto(n) do |i|
    (0).upto(n) do |j|
      if i >= sq[j]
        a[i] = [a[i], a[i - sq[j]] + 1].min
      else
        break
      end
    end
  end
  puts "Case ##{c + 1}: #{a[n]}"
end
