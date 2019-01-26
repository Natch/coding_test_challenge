# 任意で取得した３つの数の積の中で最大のものを出力する
a = '1,2,3,4,5,6,7,8,-1,-10,-200'

input_string = a.split(',')
input = input_string.map { |n| n.to_i }
candidate = input.min(3)
p input

p zero = input.select { |n| n if n == 0 }
p positive = input.select { |n| n if n > 0 }
p negative = input.select { |n| n if n < 0 }

if positive.size >= 3
  positive_producted = positive.max(3)
  positive_max = positive_producted.inject(1) { |result, n| result * n }
  candidate << positive_max
  p candidate
end
if negative.size >= 2 && positive.size >= 1
  negative_producted = negative.min(2)
  negative_max = negative_producted.inject(1) { |result, n| result * n }
  candidate << negative_max * positive.max(1).first.to_i
  p candidate
end
if negative.size >= 1 && positive.size >= 2
  positive_producted = positive.max(2)
  positive_max = positive_producted.inject(1) { |result, n| result * n }
  candidate << positive_max * negative.min(1).first.to_i
  p candidate
end
candidate << 0 if zero.size >= 1

out = candidate.max(1)
puts out
puts -1 unless input.size > 2