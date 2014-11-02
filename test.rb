print [1, 2, 3].map{|x| x += 1}
puts


print [1, 2, 3].map(&:+(1))
puts