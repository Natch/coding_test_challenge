# 排他的論理和計算
# (各桁の和が奇数なら１、そうでないなら０)
# 入力１：数
# 入力N：２進数文字列（４桁）
input_lines = gets.to_i
numbers = []
input_lines.times {
  numbers.push(gets.chomp.rjust(4, '0'))
}

sum = numbers.inject([0,0,0,0]) do |result, n|
  result[0] = (result[0].to_i + n[0].to_i).to_s
  result[1] = (result[1].to_i + n[1].to_i).to_s
  result[2] = (result[2].to_i + n[2].to_i).to_s
  result[3] = (result[3].to_i + n[3].to_i).to_s
  result
end

out = sum.map do |n|
  if n.to_i.odd?
    '1'
  else
    '0'
  end
end
printf('%04b', out.join.to_i(2))
puts