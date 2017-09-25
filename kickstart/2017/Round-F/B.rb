# WA
t = gets.chomp.to_i
t.times do |c|
  e, n = gets.chomp.split(" ").map(&:to_i)
  ss = gets.chomp.split(" ").map(&:to_i).sort
  h = 0
  ss.each do |s|
    if e > s then
      h += 1
      e -= s
    elsif e <= s && h > 0 then
      h -= 1
      e += s
    end
  end
  puts "Case ##{c + 1}: #{h}"
end