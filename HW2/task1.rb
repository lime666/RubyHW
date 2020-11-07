arr = [621, 445, 147, 159, 430, 222, 482, 44, 194, 522, 652, 494, 14, 126, 532, 387, 441, 471, 337, 446, 
	18, 36, 202, 574, 556, 458, 16, 139, 222, 220, 107, 82, 264, 366, 501, 319, 314, 430, 55, 336]
#1
puts arr.count
puts '------'
#2
puts arr.reverse
puts '------'
#3
puts arr.max
puts '------'
#4
puts arr.min
puts '------'
#5
puts arr.sort
puts '------'
#6
puts arr.sort.reverse
puts '------'
puts arr
puts '------'
#7
puts arr.select {|x| x.even?}
puts '------'
puts arr
puts '------'
#8
puts arr.select {|x| x %3 == 0}
puts '------'
#8
puts arr.uniq
puts '------'
#9
puts arr.map {|x| x.to_f / 10}
puts '------'
#10
alpha = [*?a..?z]
qwerty = []

#(0..arr.length - 1).each {|x| {(0..alpha.length - 1).each {|y| arr[x] == y ? qwerty << alpha[y]}}}
=begin
(0..arr.length - 1).map do |x|
  (0..alpha.length - 1).map do |y|
  	if arr[x] == y
  	  qwerty.append(alpha[y])
  	end
  end
end
=end
puts qwerty


#11
arr[arr.index(arr.min)], arr[arr.index(arr.max)] = arr[arr.index(arr.max)], arr[arr.index(arr.min)]
puts arr
#12
puts arr.slice(0..arr.index(arr.min) - 1)
puts '------'
#13
puts arr.sort.slice(0..2)
puts '------'