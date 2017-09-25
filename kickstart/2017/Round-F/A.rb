# AC
t = gets.chomp.to_i
t.times do |c|
  flag = true
  n = gets.chomp.to_i
  a = gets.chomp.split(" ").map(&:to_i)
  aa = a.sort
  e = a.length
  (n - 1).times do
    i = (e - 1) / 2
    p_ = a[i]
    if p_ == aa.first
      aa.shift
      a = a[0...i] + a[(i + 1)...e]
    elsif p_ == aa.last then
      aa.pop
      a = a[0...i] + a[(i + 1)...e]
    else
      puts "Case ##{c + 1}: No"
      flag = false
      break
    end
    e -= 1
  end
  puts "Case ##{c + 1}: Yes" if flag
end
